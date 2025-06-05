
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { CreditCard, Smartphone, DollarSign, Gift, Check } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Separator } from '@/components/ui/separator';
import Header from '@/components/Header';
import { useCart } from '@/contexts/CartContext';
import { useOrder } from '@/contexts/OrderContext';
import { toast } from 'sonner';

const Payment = () => {
  const navigate = useNavigate();
  const { items, totalPrice, deliveryFee, finalTotal, clearCart } = useCart();
  const { createOrder } = useOrder();
  const [selectedPayment, setSelectedPayment] = useState('credit');
  const [changeFor, setChangeFor] = useState('');

  const paymentMethods = [
    {
      id: 'credit',
      name: 'Cartão de Crédito',
      icon: CreditCard,
      description: 'Visa, Mastercard, Elo'
    },
    {
      id: 'debit',
      name: 'Cartão de Débito',
      icon: CreditCard,
      description: 'Débito na máquina'
    },
    {
      id: 'pix',
      name: 'PIX',
      icon: Smartphone,
      description: 'Pagamento instantâneo'
    },
    {
      id: 'cash',
      name: 'Dinheiro',
      icon: DollarSign,
      description: 'Pagamento na entrega'
    },
    {
      id: 'voucher',
      name: 'Vale Refeição',
      icon: Gift,
      description: 'Alelo, Sodexo, Ticket'
    }
  ];

  const handleFinishOrder = () => {
    const orderId = createOrder({
      items,
      status: 'confirmed',
      total: finalTotal,
      deliveryAddress: 'R. das Flores, 123 - Centro, São Paulo - SP',
      paymentMethod: paymentMethods.find(p => p.id === selectedPayment)?.name || '',
      estimatedTime: 35
    });

    clearCart();
    toast.success('Pedido realizado com sucesso!');
    navigate(`/order-tracking/${orderId}`);
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <Header title="Pagamento" showBack />
      
      <div className="max-w-md mx-auto px-4 pb-24">
        {/* Order Summary */}
        <Card className="mt-4 mb-4">
          <CardContent className="p-4">
            <h3 className="font-semibold text-gray-900 mb-3">Resumo do pedido</h3>
            
            <div className="space-y-2 text-sm">
              {items.map((item) => (
                <div key={item.id} className="flex justify-between">
                  <span>{item.quantity}x {item.name}</span>
                  <span>R$ {(item.price * item.quantity).toFixed(2).replace('.', ',')}</span>
                </div>
              ))}
            </div>
            
            <Separator className="my-3" />
            
            <div className="space-y-2 text-sm">
              <div className="flex justify-between">
                <span>Subtotal</span>
                <span>R$ {totalPrice.toFixed(2).replace('.', ',')}</span>
              </div>
              <div className="flex justify-between">
                <span>Taxa de entrega</span>
                <span>R$ {deliveryFee.toFixed(2).replace('.', ',')}</span>
              </div>
            </div>
            
            <Separator className="my-3" />
            
            <div className="flex justify-between font-semibold text-lg">
              <span>Total</span>
              <span className="text-primary-500">
                R$ {finalTotal.toFixed(2).replace('.', ',')}
              </span>
            </div>
          </CardContent>
        </Card>

        {/* Payment Methods */}
        <div className="space-y-3 mb-4">
          <h3 className="font-semibold text-gray-900">Forma de pagamento</h3>
          
          {paymentMethods.map((method) => {
            const Icon = method.icon;
            return (
              <Card
                key={method.id}
                className={`cursor-pointer transition-all ${
                  selectedPayment === method.id
                    ? 'ring-2 ring-primary-500 border-primary-500'
                    : 'border-gray-200 hover:border-gray-300'
                }`}
                onClick={() => setSelectedPayment(method.id)}
              >
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-3">
                      <div className="bg-primary-100 p-2 rounded-lg">
                        <Icon className="w-5 h-5 text-primary-500" />
                      </div>
                      <div>
                        <h4 className="font-medium text-gray-900">{method.name}</h4>
                        <p className="text-sm text-gray-600">{method.description}</p>
                      </div>
                    </div>
                    {selectedPayment === method.id && (
                      <Check className="w-5 h-5 text-primary-500" />
                    )}
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>

        {/* Cash Change */}
        {selectedPayment === 'cash' && (
          <Card className="mb-4">
            <CardContent className="p-4">
              <Label htmlFor="change">Troco para quanto?</Label>
              <Input
                id="change"
                placeholder="Ex: R$ 50,00"
                value={changeFor}
                onChange={(e) => setChangeFor(e.target.value)}
                className="mt-2"
              />
            </CardContent>
          </Card>
        )}

        {/* Card Details */}
        {(selectedPayment === 'credit' || selectedPayment === 'debit') && (
          <Card className="mb-4">
            <CardContent className="p-4 space-y-4">
              <h4 className="font-medium">Dados do cartão</h4>
              
              <div>
                <Label htmlFor="cardNumber">Número do cartão</Label>
                <Input
                  id="cardNumber"
                  placeholder="0000 0000 0000 0000"
                  className="mt-1"
                />
              </div>
              
              <div className="grid grid-cols-2 gap-2">
                <div>
                  <Label htmlFor="expiry">Validade</Label>
                  <Input
                    id="expiry"
                    placeholder="MM/AA"
                    className="mt-1"
                  />
                </div>
                <div>
                  <Label htmlFor="cvv">CVV</Label>
                  <Input
                    id="cvv"
                    placeholder="123"
                    className="mt-1"
                  />
                </div>
              </div>
              
              <div>
                <Label htmlFor="cardName">Nome no cartão</Label>
                <Input
                  id="cardName"
                  placeholder="João Silva"
                  className="mt-1"
                />
              </div>
            </CardContent>
          </Card>
        )}

        {/* PIX Info */}
        {selectedPayment === 'pix' && (
          <Card className="mb-4">
            <CardContent className="p-4 text-center">
              <div className="bg-gray-100 p-4 rounded-lg mb-3">
                <div className="w-32 h-32 bg-gray-300 mx-auto rounded mb-2 flex items-center justify-center">
                  QR Code
                </div>
              </div>
              <p className="text-sm text-gray-600">
                Use o app do seu banco para escanear o QR Code ou copie e cole o código PIX
              </p>
              <Button variant="outline" className="mt-3">
                Copiar código PIX
              </Button>
            </CardContent>
          </Card>
        )}
      </div>

      {/* Fixed Bottom Button */}
      <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4">
        <div className="max-w-md mx-auto">
          <Button 
            onClick={handleFinishOrder}
            className="w-full py-3 text-lg"
          >
            Finalizar pedido
          </Button>
        </div>
      </div>
    </div>
  );
};

export default Payment;
