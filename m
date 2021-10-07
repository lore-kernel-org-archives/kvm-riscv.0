From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Oct 2021 08:59:28 +0200
Subject: [GIT PULL] KVM/riscv for 5.16
In-Reply-To: <mhng-03b25a51-3491-4bb7-9e17-1b32fc97b7ff@palmerdabbelt-glaptop>
References: <mhng-03b25a51-3491-4bb7-9e17-1b32fc97b7ff@palmerdabbelt-glaptop>
Message-ID: <42039591-c445-9298-607a-76efe875eb53@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 06/10/21 18:42, Palmer Dabbelt wrote:
> On Tue, 05 Oct 2021 01:25:41 PDT (-0700), pbonzini at redhat.com wrote:
>> On 05/10/21 09:55, Anup Patel wrote:
>>> ?? git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-1
>>
>> Pulled, thanks!
> 
> Thanks!
> 
> IIUC how this generally works is that you pull these KVM-specific patch 
> sets and I don't, which means they'll get tested on my end as they loop 
> back through linux-next.? I'm fine with however this usually works, just 
> trying to make sure we're on the same page as this is my first time 
> being this close to another tree.

Generally speaking, Anup as the maintainer is responsible for things not 
breaking.  I do a cross-compile to check against changes to KVM common 
code in virt/kvm, but otherwise just take his tree and send it out to 
Linus.  Once selftests are in, I will also be able to run them under 
QEMU, again to check that changes to virt/kvm/ do not break RISC-V.

Paolo


