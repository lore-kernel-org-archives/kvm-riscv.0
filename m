From: Sean Christopherson <seanjc@google.com>
Date: Fri, 28 Jul 2023 08:53:52 -0700
Subject: [PATCH 2/4] KVM: riscv: selftests: Add exception handling support
In-Reply-To: <20230728-21d0e3ecb0d8916fd9d9bceb@orel>
References: <cover.1690364259.git.haibo1.xu@intel.com> <7e9d2d5518375083f10c92a3d1acd98914f69fd8.1690364259.git.haibo1.xu@intel.com>
 <20230728-21d0e3ecb0d8916fd9d9bceb@orel>
Message-ID: <ZMPR56RVgzI6s6Ik@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 28, 2023, Andrew Jones wrote:
> On Thu, Jul 27, 2023 at 03:20:06PM +0800, Haibo Xu wrote:
> > +void vm_init_trap_vector_tables(struct kvm_vm *vm);
> > +void vcpu_init_trap_vector_tables(struct kvm_vcpu *vcpu);
> 
> I think we should use a common name for these prototypes that the other
> architectures agree to and then put them in a common header. My vote for
> the naming is,

Just allocate the tables in kvm_arch_vm_post_create().  I've been meaning to
convert x86 and ARM, but keep getting distracted/waylaid by other things.

https://lore.kernel.org/all/Y8hCBOndYMD9zsDL at google.com

>   void vm_init_vector_tables(struct kvm_vm *vm);
>   void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
> 
> > +
> > +typedef void(*handler_fn)(struct ex_regs *);
> > +void vm_install_exception_handler(struct kvm_vm *vm, int ec, handler_fn handler);
> 
> I'd also put this typedef

And rename it to (*exception_handler_fn).

> and prototype in a common header (with s/ec/vector/ to what you have here)

Hmm, yeah, I think it makes sense to let vm_install_exception_handler() be used
from common code.  the vector to be installed is inherently arch specific, but
it would be easy enough for a test to use #ifdeffery to define the correct vector.

