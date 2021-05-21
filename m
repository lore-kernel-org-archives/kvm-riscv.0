From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 May 2021 19:21:12 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
Message-ID: <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21/05/21 19:13, Palmer Dabbelt wrote:
>> 
> 
> I don't view this code as being in a state where it can be
> maintained, at least to the standards we generally set within the
> kernel.  The ISA extension in question is still subject to change, it
> says so right at the top of the H extension 
> <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> 
>   {\bf Warning! This draft specification may change before being 
>   accepted as standard by the RISC-V Foundation.}

To give a complete picture, the last three relevant changes have been in
August 2019, November 2019 and May 2020.  It seems pretty frozen to me.

In any case, I think it's clear from the experience with Android that
the acceptance policy cannot succeed.  The only thing that such a policy
guarantees, is that vendors will use more out-of-tree code.  Keeping a
fully-developed feature out-of-tree for years is not how Linux is run.

> I'm not sure where exactly the line for real hardware is, but for
> something like this it would at least involve some chip that is
> widely availiable and needs the H extension to be useful

Anup said that "quite a few people have already implemented RISC-V
H-extension in hardware as well and KVM RISC-V works on real HW as 
well".  Those people would benefit from having KVM in the Linus tree.

Paolo


