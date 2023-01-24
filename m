From: David Matlack <dmatlack@google.com>
Date: Tue, 24 Jan 2023 09:28:29 -0800
Subject: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <Y9ASmOvJutgGLVnT@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-3-dmatlack@google.com>
 <Y9ASmOvJutgGLVnT@google.com>
Message-ID: <CALzav=fbzgpktnCX9Z7G_gN=yVVLuwB5Of3_pq3LHrQGySbHsg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 24, 2023 at 9:17 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> >
> >  arch/arm64/include/asm/kvm_host.h | 3 +++
> >  arch/arm64/kvm/Kconfig            | 1 -
> >  arch/arm64/kvm/mmu.c              | 6 +++---
> >  virt/kvm/kvm_main.c               | 2 --
> >  4 files changed, 6 insertions(+), 6 deletions(-)
>
> I think you're missing the diff that actually drops the Kconfig opton
> from virt/kvm/Kconfig.

Indeed I am, thanks for catching that!

