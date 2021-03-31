From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Mar 2021 11:21:58 +0200
Subject: [PATCH v16 00/17] KVM RISC-V Support
In-Reply-To: <CAAhSdy0F7gisk=FZXN7jmqFLVB3456WunwVXhkrnvNuWtrhWWA@mail.gmail.com>
References: <20210115121846.114528-1-anup.patel@wdc.com>
 <mhng-a4e92a0a-085d-4be0-863e-6af99dc27c18@palmerdabbelt-glaptop>
 <CAAhSdy0F7gisk=FZXN7jmqFLVB3456WunwVXhkrnvNuWtrhWWA@mail.gmail.com>
Message-ID: <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30/03/21 07:48, Anup Patel wrote:
> 
> It seems Andrew does not want to freeze H-extension until we have virtualization
> aware interrupt controller (such as RISC-V AIA specification) and IOMMU. Lot
> of us feel that these things can be done independently because RISC-V
> H-extension already has provisions for external interrupt controller with
> virtualization support.

Yes, frankly that's pretty ridiculous as it's perfectly possible to 
emulate the interrupt controller in software (and an IOMMU is not needed 
at all if you are okay with emulated or paravirtualized devices---which 
is almost always the case except for partitioning hypervisors).

Palmer, are you okay with merging RISC-V KVM?  Or should we place it in 
drivers/staging/riscv/kvm?

Either way, the best way to do it would be like this:

1) you apply patch 1 in a topic branch

2) you merge the topic branch in the risc-v tree

3) Anup merges the topic branch too and sends me a pull request.

Paolo


