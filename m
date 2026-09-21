Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2583C982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo7xXi70INGJCYJh41yWv2DSRTpPfwawO4xPijZaKhk=; b=ogCmhXHPSqipse
	pF3uB5zSF0Qy9W3iy4vacafsjGlBi8wC7Zs5XO4A3ckGAXL3JcRGpdfMq+/13iSi6jDvS4n6DBGQS
	DccFkGUgcbCX6KxvoTQhrOYjx0IkgYj2VHVzOzcEH0sql3x54anXeHXymGkAbelkigCpK33KWSv7Z
	0m41OWgl6U7xKeTf6dalTioAZSSMM8FHN7Ad6RUiqPVlHnWdFwF7fnslv9FSnVtCDyXx8oYf8MZ9S
	euK4hqMJmfFs8vU+a6WkhQ/Q3x47Ca+7rca3Ed6xPpaS24QcH9vgMxEEFgtPLteiBYj8ldlo8Kh4l
	h7DYRdpGqASzwefAEwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhf-00000001let-14Gm;
	Mon, 21 Sep 2026 10:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhc-00000001lcO-2JSr;
	Mon, 21 Sep 2026 10:56:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08EE71DB5;
	Mon, 21 Sep 2026 03:56:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0CC3F86C;
	Mon, 21 Sep 2026 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988211; bh=pfH49/wekZWH0tUlmAGPYfXLPMYhwWIki53rOu3JrVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Olwk11hTmNoCQY0yieoGRI6nr2tZK+9Y8vNgJkjNBvabvI4jw3ecE117CoBDHRZcA
	 VaHf6/WYeKfqcXLlbCGFFRZ7VeZS5wzBGURhdMIHRzkGy/szUC29S0SOD5k+/st/hm
	 ZKDb93jOuQfIb93pn4lDETSPnOoAPOixVE8trrQ8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:25 +0100
Subject: [PATCH 03/21] ARM: mm: remove custom pgdp_get()
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-3-cd40cf68242e@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yi3BzhiHjasTHpKXh1MmDEBzfM1jM8lRPSh1W8s2lTo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1MhweskEeRkdPnGVTUHtMQosteIoTZTcWZ7
 m70DkNoOo+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENTAAKCRBt1cPRWsUx
 M1pdC/9eWcL8m/evh/5ze5hTI1UzJJ9731T8JXRUtUacBadzNoIsOzFTtZcP/L/LZXeSCg+qPJI
 GlkbXXgrRzR0Y1cTWBK5XsScCAxuXdVnmkam0g6EpCc91YkNc9mg0Xvj0hhcBeYo5b6yy4EcsGk
 Eqqr8Kdfj+dow9d1FDFwO6RPyIgwXw4NOvVhy8Ye1AtUMFp57bmqyuyzFZvHE/b3dh10GbTVvQl
 zd7uAbnS0shbhwLl6nwID4BUlrc8uNzszZy7xbLQD7VD4tzIl0LPHUN1JeJoAiLWd+i4ixBSnNc
 VKFX7FvI1lzQ6+mpKnBPOJfihjR9O8/IFykRTKwpakx9mvghn3bIAmuYr31vKk4LmF6NUC3WKiQ
 lchWJeCYXYaUqbEhxl2y760Y5hHJIi1DIDkUYCunpdebAxongZeEyzxUpcxw9e005xG4lOa9qP1
 //r/dM5ak9J8No9Oco0jmCsMc2ZGFGwv/0xNxtVsYmmZoYo8sBtsLujJukxT5yfXw1zC4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035652_697666_540416CE 
X-CRM114-Status: GOOD (  10.25  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: "David Hildenbrand (Arm)" <david@kernel.org>

Now that pgd_t is no longer an array and rely on the common
code pgdp_get(), which is a static inline function that returns pgd_t.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 8dd17d20faa33..ff3868acea945 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -134,8 +134,6 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-#define pgdp_get(pgpd)		READ_ONCE(*pgdp)
-
 #define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
