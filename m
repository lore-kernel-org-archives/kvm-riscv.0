From: Heiko Stübner <heiko@sntech.de>
Date: Thu, 12 Jan 2023 00:31:59 +0100
Subject: [PATCH v3 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <20230111171027.2392-2-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org> <20230111171027.2392-2-jszhang@kernel.org>
Message-ID: <3268358.687JKscXgg@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Mittwoch, 11. Januar 2023, 18:10:15 CET schrieb Jisheng Zhang:
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

looks good, thanks for fixing the issues Andrew and Conor pointed
out in the variant in my zbb series. I've now switched over to this one.

I guess as you said, we really should separate this out into a single patch
[or if Palmer is fine with that, just pick this one patch to apply until the
rest is ready]


Heiko



