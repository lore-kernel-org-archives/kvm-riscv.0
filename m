From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 23:32:34 +0100
Subject: [RFC PATCH 06/37] KVM: MMU: Move struct kvm_mmu_page to common
 code
In-Reply-To: <20221208193857.4090582-7-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-7-dmatlack@google.com>
Message-ID: <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/8/22 20:38, David Matlack wrote:
> This commit increases the size of struct kvm_mmu_page by 64 bytes on
> x86_64 (184 bytes -> 248 bytes). The size of this struct can be reduced
> in future commits by moving TDP MMU root fields into a separate struct
> and by dynamically allocating fields only used by the Shadow MMU.

I think it's already possible to use a union like

	union {
		struct kvm_mmu_page_arch arch;
		struct {
			struct work_struct work;
			void *data;
		};
	};

Paolo


