From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:36:07 +0100
Subject: [PATCH v13 23/35] KVM: x86: Add support for "protected VMs" that
 can utilize private memory
In-Reply-To: <20231027182217.3615211-24-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-24-seanjc@google.com>
Message-ID: <a56e499f-c91c-45da-b404-444c22b2df24@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:22, Sean Christopherson wrote:
> Add a new x86 VM type, KVM_X86_SW_PROTECTED_VM, to serve as a development
> and testing vehicle for Confidential (CoCo) VMs, and potentially to even
> become a "real" product in the distant future, e.g. a la pKVM.
> 
> The private memory support in KVM x86 is aimed at AMD's SEV-SNP and
> Intel's TDX, but those technologies are extremely complex (understatement),
> difficult to debug, don't support running as nested guests, and require
> hardware that's isn't universally accessible.  I.e. relying SEV-SNP or TDX
> for maintaining guest private memory isn't a realistic option.
> 
> At the very least, KVM_X86_SW_PROTECTED_VM will enable a variety of
> selftests for guest_memfd and private memory support without requiring
> unique hardware.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

with one nit:

> +---------------------
> +
> +:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> +:Architectures: x86
> +:Type: system ioctl
> +
> +This capability returns a bitmap of support VM types.  The 1-setting of bit @n

s/support/supported/

Paolo


