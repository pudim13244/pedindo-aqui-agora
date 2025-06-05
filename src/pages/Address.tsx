
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { MapPin, Plus, Check } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import Header from '@/components/Header';

const Address = () => {
  const [selectedAddress, setSelectedAddress] = useState(1);
  const [newAddress, setNewAddress] = useState({
    label: '',
    street: '',
    number: '',
    complement: '',
    neighborhood: '',
    city: '',
    zipCode: ''
  });

  const savedAddresses = [
    {
      id: 1,
      label: 'Casa',
      address: 'R. das Flores, 123 - Centro, São Paulo - SP',
      complement: 'Apto 45',
      isDefault: true
    },
    {
      id: 2,
      label: 'Trabalho',
      address: 'Av. Paulista, 1000 - Bela Vista, São Paulo - SP',
      complement: 'Sala 1205',
      isDefault: false
    }
  ];

  const handleAddAddress = () => {
    // Here you would normally save to database
    console.log('New address:', newAddress);
    setNewAddress({
      label: '',
      street: '',
      number: '',
      complement: '',
      neighborhood: '',
      city: '',
      zipCode: ''
    });
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <Header title="Endereço de entrega" showBack />
      
      <div className="max-w-md mx-auto px-4 pb-24">
        {/* Saved Addresses */}
        <div className="py-4">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Endereços salvos</h2>
          
          <div className="space-y-3 mb-4">
            {savedAddresses.map((address) => (
              <Card
                key={address.id}
                className={`cursor-pointer transition-all ${
                  selectedAddress === address.id
                    ? 'ring-2 ring-primary-500 border-primary-500'
                    : 'border-gray-200 hover:border-gray-300'
                }`}
                onClick={() => setSelectedAddress(address.id)}
              >
                <CardContent className="p-4">
                  <div className="flex items-start justify-between">
                    <div className="flex items-start gap-3">
                      <MapPin className="w-5 h-5 text-primary-500 mt-1" />
                      <div className="flex-1">
                        <div className="flex items-center gap-2">
                          <h3 className="font-medium text-gray-900">{address.label}</h3>
                          {address.isDefault && (
                            <span className="bg-primary-100 text-primary-700 text-xs px-2 py-1 rounded">
                              Padrão
                            </span>
                          )}
                        </div>
                        <p className="text-sm text-gray-600 mt-1">{address.address}</p>
                        {address.complement && (
                          <p className="text-sm text-gray-600">{address.complement}</p>
                        )}
                      </div>
                    </div>
                    {selectedAddress === address.id && (
                      <Check className="w-5 h-5 text-primary-500" />
                    )}
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          {/* Add New Address */}
          <Dialog>
            <DialogTrigger asChild>
              <Button variant="outline" className="w-full">
                <Plus className="w-4 h-4 mr-2" />
                Adicionar novo endereço
              </Button>
            </DialogTrigger>
            <DialogContent className="max-w-md mx-auto">
              <DialogHeader>
                <DialogTitle>Novo endereço</DialogTitle>
              </DialogHeader>
              
              <div className="space-y-4">
                <div>
                  <Label htmlFor="label">Nome do endereço</Label>
                  <Input
                    id="label"
                    placeholder="Ex: Casa, Trabalho"
                    value={newAddress.label}
                    onChange={(e) => setNewAddress(prev => ({ ...prev, label: e.target.value }))}
                  />
                </div>
                
                <div>
                  <Label htmlFor="zipCode">CEP</Label>
                  <Input
                    id="zipCode"
                    placeholder="00000-000"
                    value={newAddress.zipCode}
                    onChange={(e) => setNewAddress(prev => ({ ...prev, zipCode: e.target.value }))}
                  />
                </div>
                
                <div className="grid grid-cols-3 gap-2">
                  <div className="col-span-2">
                    <Label htmlFor="street">Rua</Label>
                    <Input
                      id="street"
                      placeholder="Nome da rua"
                      value={newAddress.street}
                      onChange={(e) => setNewAddress(prev => ({ ...prev, street: e.target.value }))}
                    />
                  </div>
                  <div>
                    <Label htmlFor="number">Número</Label>
                    <Input
                      id="number"
                      placeholder="123"
                      value={newAddress.number}
                      onChange={(e) => setNewAddress(prev => ({ ...prev, number: e.target.value }))}
                    />
                  </div>
                </div>
                
                <div>
                  <Label htmlFor="complement">Complemento (opcional)</Label>
                  <Input
                    id="complement"
                    placeholder="Apto, bloco, etc."
                    value={newAddress.complement}
                    onChange={(e) => setNewAddress(prev => ({ ...prev, complement: e.target.value }))}
                  />
                </div>
                
                <div className="grid grid-cols-2 gap-2">
                  <div>
                    <Label htmlFor="neighborhood">Bairro</Label>
                    <Input
                      id="neighborhood"
                      placeholder="Bairro"
                      value={newAddress.neighborhood}
                      onChange={(e) => setNewAddress(prev => ({ ...prev, neighborhood: e.target.value }))}
                    />
                  </div>
                  <div>
                    <Label htmlFor="city">Cidade</Label>
                    <Input
                      id="city"
                      placeholder="Cidade"
                      value={newAddress.city}
                      onChange={(e) => setNewAddress(prev => ({ ...prev, city: e.target.value }))}
                    />
                  </div>
                </div>
                
                <Button onClick={handleAddAddress} className="w-full">
                  Salvar endereço
                </Button>
              </div>
            </DialogContent>
          </Dialog>
        </div>
      </div>

      {/* Fixed Bottom Button */}
      <div className="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 p-4">
        <div className="max-w-md mx-auto">
          <Link to="/payment">
            <Button className="w-full py-3 text-lg">
              Continuar para pagamento
            </Button>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Address;
