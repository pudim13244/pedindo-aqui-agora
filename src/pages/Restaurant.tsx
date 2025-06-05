
import React, { useState } from 'react';
import { useParams } from 'react-router-dom';
import { Star, Clock, Plus } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import { Textarea } from '@/components/ui/textarea';
import { Checkbox } from '@/components/ui/checkbox';
import Header from '@/components/Header';
import { useCart } from '@/contexts/CartContext';
import { toast } from 'sonner';

const Restaurant = () => {
  const { id } = useParams();
  const { addItem } = useCart();
  const [selectedItem, setSelectedItem] = useState<any>(null);
  const [customizations, setCustomizations] = useState<string[]>([]);
  const [observations, setObservations] = useState('');

  const restaurant = {
    id: 1,
    name: 'Pizzaria Bella Napoli',
    category: 'Pizza',
    rating: 4.8,
    deliveryTime: '25-35 min',
    deliveryFee: 'R$ 4,99',
    distance: '1.2 km',
    image: '/placeholder.svg',
    description: 'Autêntica pizza italiana feita no forno a lenha'
  };

  const menuSections = [
    {
      id: 1,
      name: 'Pizzas Tradicionais',
      items: [
        {
          id: 1,
          name: 'Pizza Margherita',
          description: 'Molho de tomate, mussarela, manjericão fresco',
          price: 32.90,
          image: '/placeholder.svg',
          customizations: ['Borda recheada (+R$ 5)', 'Extra queijo (+R$ 3)', 'Sem cebola']
        },
        {
          id: 2,
          name: 'Pizza Calabresa',
          description: 'Molho de tomate, mussarela, calabresa, cebola',
          price: 36.90,
          image: '/placeholder.svg',
          customizations: ['Borda recheada (+R$ 5)', 'Extra queijo (+R$ 3)', 'Sem cebola']
        },
      ]
    },
    {
      id: 2,
      name: 'Bebidas',
      items: [
        {
          id: 3,
          name: 'Coca-Cola 350ml',
          description: 'Refrigerante gelado',
          price: 5.90,
          image: '/placeholder.svg',
          customizations: []
        },
        {
          id: 4,
          name: 'Suco de Laranja 300ml',
          description: 'Suco natural da fruta',
          price: 7.90,
          image: '/placeholder.svg',
          customizations: ['Com gelo', 'Sem açúcar']
        },
      ]
    },
  ];

  const handleAddToCart = () => {
    if (!selectedItem) return;

    addItem({
      id: `${selectedItem.id}-${Date.now()}`,
      name: selectedItem.name,
      price: selectedItem.price,
      restaurantId: restaurant.id.toString(),
      restaurantName: restaurant.name,
      image: selectedItem.image,
      customizations,
      observations: observations.trim() || undefined
    });

    toast.success('Item adicionado ao carrinho!');
    setSelectedItem(null);
    setCustomizations([]);
    setObservations('');
  };

  const toggleCustomization = (customization: string) => {
    setCustomizations(prev =>
      prev.includes(customization)
        ? prev.filter(c => c !== customization)
        : [...prev, customization]
    );
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <Header title={restaurant.name} showBack />
      
      <div className="max-w-md mx-auto">
        {/* Restaurant Header */}
        <div className="bg-white">
          <img
            src={restaurant.image}
            alt={restaurant.name}
            className="w-full h-48 object-cover"
          />
          <div className="p-4">
            <h1 className="text-xl font-bold text-gray-900">{restaurant.name}</h1>
            <p className="text-gray-600 mb-2">{restaurant.description}</p>
            <div className="flex items-center justify-between text-sm text-gray-600">
              <div className="flex items-center gap-1">
                <Star className="w-4 h-4 fill-yellow-400 text-yellow-400" />
                <span>{restaurant.rating}</span>
              </div>
              <div className="flex items-center gap-1">
                <Clock className="w-4 h-4" />
                <span>{restaurant.deliveryTime}</span>
              </div>
              <span>{restaurant.deliveryFee}</span>
              <span>{restaurant.distance}</span>
            </div>
          </div>
        </div>

        {/* Menu */}
        <div className="px-4 pb-20">
          {menuSections.map((section) => (
            <div key={section.id} className="mb-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-3 mt-4">
                {section.name}
              </h2>
              <div className="space-y-3">
                {section.items.map((item) => (
                  <Card key={item.id} className="overflow-hidden">
                    <CardContent className="p-0">
                      <div className="flex">
                        <div className="flex-1 p-3">
                          <h3 className="font-semibold text-gray-900">{item.name}</h3>
                          <p className="text-sm text-gray-600 mb-2">{item.description}</p>
                          <p className="text-lg font-bold text-primary-500">
                            R$ {item.price.toFixed(2).replace('.', ',')}
                          </p>
                        </div>
                        <div className="w-24 h-24 relative">
                          <img
                            src={item.image}
                            alt={item.name}
                            className="w-full h-full object-cover"
                          />
                          <Dialog>
                            <DialogTrigger asChild>
                              <Button
                                size="sm"
                                className="absolute -bottom-2 -right-2 rounded-full w-8 h-8 p-0"
                                onClick={() => setSelectedItem(item)}
                              >
                                <Plus className="w-4 h-4" />
                              </Button>
                            </DialogTrigger>
                            <DialogContent className="max-w-md mx-auto">
                              <DialogHeader>
                                <DialogTitle>{selectedItem?.name}</DialogTitle>
                              </DialogHeader>
                              
                              {selectedItem && (
                                <div className="space-y-4">
                                  <img
                                    src={selectedItem.image}
                                    alt={selectedItem.name}
                                    className="w-full h-32 object-cover rounded"
                                  />
                                  
                                  <p className="text-gray-600">{selectedItem.description}</p>
                                  
                                  {selectedItem.customizations.length > 0 && (
                                    <div>
                                      <h3 className="font-medium mb-2">Personalizações</h3>
                                      <div className="space-y-2">
                                        {selectedItem.customizations.map((customization: string) => (
                                          <div key={customization} className="flex items-center space-x-2">
                                            <Checkbox
                                              checked={customizations.includes(customization)}
                                              onCheckedChange={() => toggleCustomization(customization)}
                                            />
                                            <label className="text-sm">{customization}</label>
                                          </div>
                                        ))}
                                      </div>
                                    </div>
                                  )}
                                  
                                  <div>
                                    <h3 className="font-medium mb-2">Observações</h3>
                                    <Textarea
                                      placeholder="Ex: sem cebola, ponto da carne..."
                                      value={observations}
                                      onChange={(e) => setObservations(e.target.value)}
                                      rows={3}
                                    />
                                  </div>
                                  
                                  <div className="flex items-center justify-between pt-4 border-t">
                                    <span className="text-lg font-bold">
                                      R$ {selectedItem.price.toFixed(2).replace('.', ',')}
                                    </span>
                                    <Button onClick={handleAddToCart} className="px-6">
                                      Adicionar ao carrinho
                                    </Button>
                                  </div>
                                </div>
                              )}
                            </DialogContent>
                          </Dialog>
                        </div>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Restaurant;
