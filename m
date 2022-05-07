From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Sat, 7 May 2022 15:46:59 +0800
Subject: [PATCH v4 02/20] KVM: x86/mmu: Use a bool for direct
In-Reply-To: <20220422210546.458943-3-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-3-dmatlack@google.com>
Message-ID: <d06c57fb-5c54-e496-7c0b-f5a57912f082@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 2022/4/23 05:05, David Matlack wrote:
> The parameter "direct" can either be true or false, and all of the
> callers pass in a bool variable or true/false literal, so just use the
> type bool.
>
> No functional change intended.
>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---


Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>


