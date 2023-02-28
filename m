From: Thomas Huth <thuth@redhat.com>
Date: Tue, 28 Feb 2023 22:05:25 +0100
Subject: [PATCH v2 6/6] KVM: Change return type of kvm_arch_vm_ioctl() to
 "int"
In-Reply-To: <20230208140105.655814-7-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
 <20230208140105.655814-7-thuth@redhat.com>
Message-ID: <04213fad-909f-e86d-caaa-c559917b2e4d@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08/02/2023 15.01, Thomas Huth wrote:
> All kvm_arch_vm_ioctl() implementations now only deal with "int"
> types as return values, so we can change the return type of these
> functions to use "int" instead of "long".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/arm64/kvm/arm.c       | 3 +--
>   arch/mips/kvm/mips.c       | 4 ++--
>   arch/powerpc/kvm/powerpc.c | 5 ++---
>   arch/riscv/kvm/vm.c        | 3 +--
>   arch/s390/kvm/kvm-s390.c   | 3 +--
>   arch/x86/kvm/x86.c         | 3 +--
>   include/linux/kvm_host.h   | 3 +--
>   7 files changed, 9 insertions(+), 15 deletions(-)

Ping!

Unless I missed something, I think this series had enough review ... Paolo, 
could you maybe queue the whole series, since it's mostly an 
architecture-wide clean up?

  Thanks,
   Thomas


