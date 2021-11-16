From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 16 Nov 2021 11:50:21 +0000
Subject: [PATCH 0/7] KVM: Add Makefile.kvm for common files
In-Reply-To: <537a1d4e-9168-cd4a-cd2f-cddfd8733b05@redhat.com>
References: <5d4002373c3ae614cb87b72ba5b7cdc161a0cd46.camel@infradead.org>
 <624bc910-1bec-e6dd-b09a-f86dc6cdbef0@redhat.com>
 <0372987a52b5f43963721b517664830e7e6f1818.camel@infradead.org>
 <1f326c33-3acf-911a-d1ef-c72f0a570761@redhat.com>
 <3645b9b889dac6438394194bb5586a46b68d581f.camel@infradead.org>
 <309f61f7-72fd-06a2-84b4-97dfc3fab587@redhat.com>
 <96cef64bf7927b6a0af2173b0521032f620551e4.camel@infradead.org>
 <40d7d808-dce6-a541-18dc-b0c7f4d6586c@redhat.com>
 <2b400dbb16818da49fb599b9182788ff9896dcda.camel@infradead.org>
 <32b00203-e093-8ffc-a75b-27557b5ee6b1@redhat.com>
 <28435688bab2dc1e272acc02ce92ba9a7589074f.camel@infradead.org>
 <4c37db19-14ed-46b8-eabe-0381ba879e5c@redhat.com>
 <537fdcc6af80ba6285ae0cdecdb615face25426f.camel@infradead.org>
 <7e4b895b-8f36-69cb-10a9-0b4139b9eb79@redhat.com>
 <95fae9cf56b1a7f0a5f2b9a1934e29e924908ff2.camel@infradead.org>
 <3a2a9a8c-db98-b770-78e2-79f5880ce4ed@redhat.com>
 <2c7eee5179d67694917a5a0d10db1bce24af61bf.camel@infradead.org>
 <537a1d4e-9168-cd4a-cd2f-cddfd8733b05@redhat.com>
Message-ID: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-11-15 at 20:26 +0100, Paolo Bonzini wrote:
> > > Also, for the small requests: since you are at it, can you add the code
> > > in a new file under virt/kvm/?
> >
> > Hm... only if I can make hva_to_pfn() and probably a handful of other
> > things non-static?
> 
> Yes, I think sooner or later we also want all pfn stuff in one file 
> (together with MMU notifiers) and all hva stuff in another; so for now 
> you can create virt/kvm/hva_to_pfn.h, or virt/kvm/mm.h, or whatever 
> color of the bikeshed you prefer.


OK... let's start with this.

David Woodhouse (7):
      KVM: Introduce CONFIG_HAVE_KVM_DIRTY_RING
      KVM: Add Makefile.kvm for common files, use it for x86
      KVM: s390: Use Makefile.kvm for common files
      KVM: mips: Use Makefile.kvm for common files
      KVM: RISC-V: Use Makefile.kvm for common files
      KVM: powerpc: Use Makefile.kvm for common files
      KVM: arm64: Use Makefile.kvm for common files

 arch/arm64/kvm/Makefile        |  6 ++----
 arch/mips/kvm/Makefile         |  3 ++-
 arch/powerpc/kvm/Makefile      |  6 +-----
 arch/riscv/kvm/Makefile        |  6 +-----
 arch/s390/kvm/Makefile         |  6 ++----
 arch/x86/kvm/Kconfig           |  1 +
 arch/x86/kvm/Makefile          |  7 +------
 include/linux/kvm_dirty_ring.h |  8 ++++----
 virt/kvm/Kconfig               |  3 +++
 virt/kvm/Makefile.kvm          | 13 +++++++++++++
 virt/kvm/kvm_main.c            |  4 ++--
 11 files changed, 32 insertions(+), 31 deletions(-)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 5174 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20211116/40019c66/attachment.p7s>
