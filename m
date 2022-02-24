From: Reiji Watanabe <reijiw@google.com>
Date: Wed, 23 Feb 2022 23:07:54 -0800
Subject: [PATCH v3 05/19] KVM: arm64: Dedupe vCPU power off helpers
In-Reply-To: <20220223041844.3984439-6-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-6-oupton@google.com>
Message-ID: <CAAeT=Fz7jCBGS6UkMJRjgRfOo-8Bs5S0kkJfpmyq9Q+bwGD=+A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 22, 2022 at 8:19 PM Oliver Upton <oupton@google.com> wrote:
>
> vcpu_power_off() and kvm_psci_vcpu_off() are equivalent; rename the
> former and replace all callsites to the latter.
>
> No functional change intended.
>
> Signed-off-by: Oliver Upton <oupton@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

