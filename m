From: Oliver Upton <oupton@google.com>
Date: Tue, 22 Feb 2022 20:26:24 -0800
Subject: [PATCH v3 14/19] KVM: arm64: Raise default PSCI version to v1.1
In-Reply-To: <20220223041844.3984439-15-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-15-oupton@google.com>
Message-ID: <CAOQ_Qsgw4oHAf84tjwn3aBWgiNGPT_CxE8AxRm4Sf+GTx5uUwQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 22, 2022 at 8:19 PM Oliver Upton <oupton@google.com> wrote:
>
> As it turns out, KVM already implements the requirements of PSCI v1.1.
> Raise the default PSCI version to v1.1 to actually advertise as such.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Oliver Upton <oupton@google.com>

Ah, looks like this is already in /next, courtesy of Will :-)

https://lore.kernel.org/all/20220221153524.15397-2-will at kernel.org/

--
Thanks,
Oliver

