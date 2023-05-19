From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 May 2023 09:50:06 -0700
Subject: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V
 in RISCV_HWPROBE_KEY_IMA_EXT_0
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-4-andy.chiu@sifive.com>
Message-ID: <CALs-HstHyZ055SDu8s_KyACERufD1tU8_hxM1UckN4YF4ms2Cg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18, 2023 at 9:20?AM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Thanks Andy!

Reviewed-by: Evan Green <evan@rivosinc.com>

ps- This will end up conflicting with my patch which moves that hunk
to a helper function, and also allocates the same hwprobe bit [1].
The fixup is very straightforward for a human, so the ordering isn't a big
deal either way. But I thought I'd give you a heads up so you weren't
surprised if someone mentioned it.

[1] https://lore.kernel.org/lkml/20230509182504.2997252-4-evan at rivosinc.com/

