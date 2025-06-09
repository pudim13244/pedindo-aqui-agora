
import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { ShoppingCart, ArrowLeft, User } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { useCart } from '@/contexts/CartContext';

interface HeaderProps {
  title?: string;
  showBack?: boolean;
  showCart?: boolean;
  showProfile?: boolean;
}

const Header = ({ title, showBack = false, showCart = true, showProfile = true }: HeaderProps) => {
  const navigate = useNavigate();
  const { totalItems } = useCart();

  return (
    <header className="bg-primary text-white px-4 py-3 flex items-center justify-between">
      <div className="flex items-center gap-3">
        {showBack && (
          <Button
            variant="ghost"
            size="sm"
            onClick={() => navigate(-1)}
            className="text-white hover:bg-white/20 p-2"
          >
            <ArrowLeft className="w-5 h-5" />
          </Button>
        )}
        <h1 className="text-lg font-semibold">
          {title || 'PedindoApp'}
        </h1>
      </div>
      
      <div className="flex items-center gap-2">
        {showProfile && (
          <Link to="/profile">
            <Button
              variant="ghost"
              size="sm"
              className="text-white hover:bg-white/20 p-2"
            >
              <User className="w-5 h-5" />
            </Button>
          </Link>
        )}
        {showCart && (
          <Link to="/cart" className="relative">
            <Button
              variant="ghost"
              size="sm"
              className="text-white hover:bg-white/20 p-2"
            >
              <ShoppingCart className="w-5 h-5" />
              {totalItems > 0 && (
                <span className="absolute -top-1 -right-1 bg-accent-300 text-accent-800 text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {totalItems}
                </span>
              )}
            </Button>
          </Link>
        )}
      </div>
    </header>
  );
};

export default Header;
