From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 20 Jun 2022 14:03:58 +0200
Subject: [PATCH 0/3] KVM: selftests: Consolidate ucall code
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
References: <20220618001618.1840806-1-seanjc@google.com>
Message-ID: <19bba1a0-8fb7-2aae-a65a-1111e29b92d3@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/18/22 02:16, Sean Christopherson wrote:
> Consolidate the code for making and getting ucalls.  All architectures pass
> the ucall struct via memory, so filling and copying the struct is 100%
> generic.  The only per-arch code is sending and receiving the address of
> said struct.
> 
> Tested on x86 and arm, compile tested on s390 and RISC-V.

I'm not sure about doing this yet.  The SEV tests added multiple 
implementations of the ucalls in one architecture.  I have rebased those 
recently (not the SEV part) to get more familiar with the new kvm_vcpu 
API for selftests, and was going to look at your old review next...

Paolo


