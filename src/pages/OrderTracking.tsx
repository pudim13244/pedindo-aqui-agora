
import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { CheckCircle, Clock, Truck, Star } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Avatar, AvatarImage, AvatarFallback } from '@/components/ui/avatar';
import { Progress } from '@/components/ui/progress';
import Header from '@/components/Header';
import { useOrder } from '@/contexts/OrderContext';

const OrderTracking = () => {
  const { orderId } = useParams();
  const { getOrder } = useOrder();
  const [order, setOrder] = useState(getOrder(orderId || ''));
  const [progress, setProgress] = useState(0);

  const statusSteps = [
    { id: 'confirmed', label: 'Pedido confirmado', icon: CheckCircle },
    { id: 'preparing', label: 'Preparando', icon: Clock },
    { id: 'on_way', label: 'Saiu para entrega', icon: Truck },
    { id: 'delivered', label: 'Entregue', icon: CheckCircle }
  ];

  useEffect(() => {
    // Update order status in real-time
    const interval = setInterval(() => {
      const updatedOrder = getOrder(orderId || '');
      if (updatedOrder) {
        setOrder(updatedOrder);
      }
    }, 1000);

    return () => clearInterval(interval);
  }, [orderId, getOrder]);

  useEffect(() => {
    if (order) {
      const currentStepIndex = statusSteps.findIndex(step => step.id === order.status);
      setProgress(((currentStepIndex + 1) / statusSteps.length) * 100);
    }
  }, [order?.status]);

  if (!order) {
    return (
      <div className="min-h-screen bg-gray-50">
        <Header title="Pedido não encontrado" showBack />
        <div className="max-w-md mx-auto px-4 py-8 text-center">
          <p className="text-gray-600">Pedido não encontrado</p>
        </div>
      </div>
    );
  }

  const currentStepIndex = statusSteps.findIndex(step => step.id === order.status);

  return (
    <div className="min-h-screen bg-gray-50">
      <Header title="Acompanhar pedido" showBack showCart={false} />
      
      <div className="max-w-md mx-auto px-4 pb-8">
        {/* Order Status */}
        <Card className="mt-4 mb-4">
          <CardContent className="p-6">
            <div className="text-center mb-6">
              <h2 className="text-xl font-semibold text-gray-900 mb-2">
                Pedido #{order.id}
              </h2>
              <p className="text-gray-600">
                Tempo estimado: {order.estimatedTime} minutos
              </p>
            </div>

            {/* Progress Bar */}
            <div className="mb-6">
              <Progress value={progress} className="h-2 mb-4" />
              <div className="flex justify-between">
                {statusSteps.map((step, index) => {
                  const Icon = step.icon;
                  const isCompleted = index <= currentStepIndex;
                  const isCurrent = index === currentStepIndex;
                  
                  return (
                    <div key={step.id} className="flex flex-col items-center">
                      <div className={`p-2 rounded-full mb-2 ${
                        isCompleted 
                          ? 'bg-primary-500 text-white' 
                          : 'bg-gray-200 text-gray-400'
                      }`}>
                        <Icon className="w-4 h-4" />
                      </div>
                      <span className={`text-xs text-center ${
                        isCurrent ? 'font-semibold text-primary-500' : 'text-gray-600'
                      }`}>
                        {step.label}
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>

            {/* Current Status Message */}
            <div className="text-center p-4 bg-primary-50 rounded-lg">
              <p className="text-primary-700 font-medium">
                {order.status === 'confirmed' && 'Seu pedido foi confirmado!'}
                {order.status === 'preparing' && 'Seu pedido está sendo preparado'}
                {order.status === 'on_way' && 'Seu pedido saiu para entrega'}
                {order.status === 'delivered' && 'Seu pedido foi entregue!'}
              </p>
            </div>
          </CardContent>
        </Card>

        {/* Delivery Person */}
        {(order.status === 'on_way' || order.status === 'delivered') && order.deliveryPerson && (
          <Card className="mb-4">
            <CardContent className="p-4">
              <h3 className="font-semibold text-gray-900 mb-3">Entregador</h3>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <Avatar>
                    <AvatarImage src={order.deliveryPerson.photo} />
                    <AvatarFallback>
                      {order.deliveryPerson.name.split(' ').map(n => n[0]).join('')}
                    </AvatarFallback>
                  </Avatar>
                  <div>
                    <h4 className="font-medium text-gray-900">
                      {order.deliveryPerson.name}
                    </h4>
                    <div className="flex items-center gap-1">
                      <Star className="w-3 h-3 fill-yellow-400 text-yellow-400" />
                      <span className="text-sm text-gray-600">
                        {order.deliveryPerson.rating}
                      </span>
                    </div>
                  </div>
                </div>
                <Button variant="outline" size="sm">
                  Ligar
                </Button>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Order Details */}
        <Card className="mb-4">
          <CardContent className="p-4">
            <h3 className="font-semibold text-gray-900 mb-3">Detalhes do pedido</h3>
            
            <div className="space-y-2 text-sm mb-3">
              {order.items.map((item) => (
                <div key={item.id} className="flex justify-between">
                  <span>{item.quantity}x {item.name}</span>
                  <span>R$ {(item.price * item.quantity).toFixed(2).replace('.', ',')}</span>
                </div>
              ))}
            </div>
            
            <div className="border-t pt-3">
              <div className="flex justify-between font-semibold">
                <span>Total</span>
                <span className="text-primary-500">
                  R$ {order.total.toFixed(2).replace('.', ',')}
                </span>
              </div>
              <p className="text-sm text-gray-600 mt-1">
                Pagamento: {order.paymentMethod}
              </p>
            </div>
          </CardContent>
        </Card>

        {/* Delivery Address */}
        <Card className="mb-6">
          <CardContent className="p-4">
            <h3 className="font-semibold text-gray-900 mb-2">Endereço de entrega</h3>
            <p className="text-gray-600">{order.deliveryAddress}</p>
          </CardContent>
        </Card>

        {/* Actions */}
        {order.status === 'delivered' && (
          <div className="space-y-3">
            <Button className="w-full">
              <Star className="w-4 h-4 mr-2" />
              Avaliar pedido
            </Button>
            <Button variant="outline" className="w-full">
              Pedir novamente
            </Button>
          </div>
        )}
      </div>
    </div>
  );
};

export default OrderTracking;
