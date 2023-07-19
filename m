From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 Jul 2023 19:12:18 +0200
Subject: [RFC PATCH v11 02/29] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
In-Reply-To: <20230718234512.1690985-3-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-3-seanjc@google.com>
Message-ID: <095133d1-ad3a-8b5d-d000-10b0b377c7b3@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


