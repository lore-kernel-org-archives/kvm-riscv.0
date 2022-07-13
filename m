From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Jul 2022 08:00:02 +0200
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #2
In-Reply-To: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
References: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
Message-ID: <01ec025d-fbde-5e58-2221-a368d4e1bb3a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/13/22 07:47, Anup Patel wrote:
> Hi Paolo,
> 
> We have two more fixes for 5.19 which were discovered recently:
> 1) Fix missing PAGE_PFN_MASK
> 2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

Pulled, thanks.

For the latter, my suggestion is to remove KVM_REQ_SLEEP completely and 
key the waiting on kvm_arch_vcpu_runnable using kvm_vcpu_halt or 
kvm_vcpu_block.

Also, I only had a quick look but it seems like vcpu->arch.pause is 
never written?

Paolo


