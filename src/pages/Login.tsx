
import React from 'react';
import { Link } from 'react-router-dom';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from '@/components/ui/form';
import { useForm } from 'react-hook-form';
import Header from '@/components/Header';

interface LoginForm {
  email: string;
  password: string;
}

const Login = () => {
  const form = useForm<LoginForm>({
    defaultValues: {
      email: '',
      password: ''
    }
  });

  const handleSubmit = (data: LoginForm) => {
    console.log('Login attempt:', data);
    // Aqui seria implementada a lógica de login
  };

  return (
    <div className="min-h-screen bg-primary-50">
      <Header title="Entrar" showBack />
      
      <div className="max-w-md mx-auto px-4 py-8">
        <Card className="border-0 shadow-lg">
          <CardHeader className="text-center">
            <CardTitle className="text-2xl font-bold text-gray-900">
              Bem-vindo de volta!
            </CardTitle>
            <p className="text-gray-600">Entre na sua conta para continuar</p>
          </CardHeader>
          
          <CardContent>
            <Form {...form}>
              <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-4">
                <FormField
                  control={form.control}
                  name="email"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>E-mail</FormLabel>
                      <FormControl>
                        <Input 
                          placeholder="Digite seu e-mail" 
                          type="email"
                          {...field}
                          className="focus:border-primary-300 focus:ring-primary-200"
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />

                <FormField
                  control={form.control}
                  name="password"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>Senha</FormLabel>
                      <FormControl>
                        <Input 
                          placeholder="Digite sua senha" 
                          type="password"
                          {...field}
                          className="focus:border-primary-300 focus:ring-primary-200"
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />

                <Button 
                  type="submit"
                  className="w-full bg-primary hover:bg-primary-600 text-white"
                >
                  Entrar
                </Button>
              </form>
            </Form>

            <div className="mt-6 text-center">
              <p className="text-sm text-gray-600 mb-2">
                Esqueceu sua senha?
              </p>
              <Button variant="link" className="text-primary-600 hover:text-primary-700 p-0">
                Recuperar senha
              </Button>
            </div>

            <div className="mt-6 text-center">
              <p className="text-sm text-gray-600 mb-2">
                Não tem uma conta?
              </p>
              <Link to="/register">
                <Button variant="outline" className="border-primary-300 text-primary-600 hover:bg-primary-50">
                  Criar conta
                </Button>
              </Link>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Login;
