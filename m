From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:34:12 +0100
Subject: [PATCH v13 22/35] KVM: Allow arch code to track number of memslot
 address spaces per VM
In-Reply-To: <20231027182217.3615211-23-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-23-seanjc@google.com>
Message-ID: <9bc69994-c98f-48e4-b956-08a8d98a6e6d@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:22, Sean Christopherson wrote:
> Let x86 track the number of address spaces on a per-VM basis so that KVM
> can disallow SMM memslots for confidential VMs.  Confidentials VMs are
> fundamentally incompatible with emulating SMM, which as the name suggests
> requires being able to read and write guest memory and register state.
> 
> Disallowing SMM will simplify support for guest private memory, as KVM
> will not need to worry about tracking memory attributes for multiple
> address spaces (SMM is the only "non-default" address space across all
> architectures).

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


