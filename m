From: Reiji Watanabe <reijiw@google.com>
Date: Wed, 23 Feb 2022 22:55:12 -0800
Subject: [PATCH v3 03/19] KVM: arm64: Reject invalid addresses for CPU_ON
 PSCI call
In-Reply-To: <20220223041844.3984439-4-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-4-oupton@google.com>
Message-ID: <CAAeT=FyP36QL1Dsjx-7rOJ-bwUtXJD89YxndMo8hvyBjM_z6cA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 22, 2022 at 8:19 PM Oliver Upton <oupton@google.com> wrote:
>
> DEN0022D.b 5.6.2 "Caller responsibilities" states that a PSCI
> implementation may return INVALID_ADDRESS for the CPU_ON call if the
> provided entry address is known to be invalid. There is an additional
> caveat to this rule. Prior to PSCI v1.0, the INVALID_PARAMETERS error
> is returned instead. Check the guest's PSCI version and return the
> appropriate error if the IPA is invalid.
>
> Reported-by: Reiji Watanabe <reijiw@google.com>
> Signed-off-by: Oliver Upton <oupton@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

