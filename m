Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0360A261C
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6lkb2zq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nbJ29IH6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GAuW4ieSpuH1cglHsuVp/kNuq082JInZoct9k5ByiXE=; b=K6lkb2zqO3pY1Vx7SGrSRBTSRD
	eY08Vhde928se6LJF1q8AaqFqNEoE+KBvx0fwxjT/roSK1IaV6u/kD6wejEj0kD5O9xzC7W2T/Vju
	YysN1AaUXaXVVFEs5fC6wSZnFxZw/xdKcskcx56QaDpPFDcGDM4oFMRUgsQ9cYzF5pyAQMhuuYd7T
	w5tYagDL7CBc1mL+UfoR8lyAx82RqQl0aIVvpIqGV77miBzdZGOc+Zt7TOzBmqAh/6GfGEwBqRzWi
	hY17he9QTTm3Zmyv9/jLZcKTM4U2KQXQBopyiAKO6o22Goai+fqNR8yv1wGcasA99eQ86FI3ErN+o
	crrWyB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6k-0000000GII1-0Q7e;
	Mon, 02 Nov 2026 11:21:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6h-0000000GIG6-2afx;
	Mon, 02 Nov 2026 11:21:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 505DE2A31;
	Mon,  2 Nov 2026 03:21:39 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638CC3F632;
	Mon,  2 Nov 2026 03:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618502; bh=vEzrqCWaH6sVkcTMp6OI/QOpWZT9yXWBiNbXxiv6lmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nbJ29IH6dzX4ajlSXZsYxUhN1Lgz7qI7Kf5XaxQjBx/xo9v7XPDH8Ju+9BXJRBPse
	 e8oLA7buAWAo7aZl1xI9J9NpPa0gvVM1iZGlL9vD4OwU9kc5aWCdjj4sVHMsz5gOdC
	 kzyj1pP43iYB3WNlRCyithRJP5str24lHrOCdHmc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:14 +0000
Subject: [PATCH RESEND v2 01/21] ARM: mm: make nommu pgd_t a scalar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-1-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=ODmKgHrv0SlU2okc3grPddikJ1BO4DLAINSWVDYQruI=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIvGLS699hx7hG7O/gmI78xbHdrhwDkf+7I9
 DWzP3L/JCaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyLwAKCRBt1cPRWsUx
 M3LaDACfxss2j2NeE3BbTwwhokaDiCVaW/H2/Mn+uUenKG2jgF/kgodnvVS74EsJjBiO+N61g8k
 jWQPIwa3DH8V2Bt7Ff/0DyErPtKYiTAgNkr0bTxKT8vl3v5bJYwh2f8oMpNlskDhO5YF9ajXEFZ
 4ER8DxM8Y0Bot9aN/p+GNwx5V7S7M+ZxGwyoFmLXbIMo8frKb97sxPDAfsQWhXc/21AGoZR07PA
 INOCEo64nIFS15biXbqjKkhz6Cg9u4ZiO2+9vVuGSmKykqv/EuGUfHOmt969sV+myhOj6IOf9Y7
 Pm5ViXArvK4RfqS7EjpzDiY+Ijjv+sJGjYyXgNxNfnVM57alioKTkUndEkuHX0dCDAOx2+PcrCg
 3E0y/PCa4svejSAe9h8r+1ip3k9DsHNUK382M6HKF32gPu7Wr7WsSAR4RGYgAKC+6k2G0Iy/yKt
 3AY/4iUvtbWQKzfONYzBUemon4pM3LwvK4VOQ4z77hFiMuT2j+pbqBBod0/uxLBwdhzPQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032143_741365_E1CB0AEF 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "David Hildenbrand (Arm)" <david@kernel.org>

As pgd_t is returned  from a function, like pgdp_get(). pgd_t shouldn't be
an array.

There is no need to match the actual arm page tables, because with nommu
there are no page tables. It's all just in place to make the compiler
happy. Making it a scalar will make the compiler happy.

So let's just use an u32.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/page-nommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/page-nommu.h b/arch/arm/include/asm/page-nommu.h
index e74415c959bea..88659b38e2364 100644
--- a/arch/arm/include/asm/page-nommu.h
+++ b/arch/arm/include/asm/page-nommu.h
@@ -18,12 +18,12 @@
  */
 typedef unsigned long pte_t;
 typedef unsigned long pmd_t;
-typedef unsigned long pgd_t[2];
+typedef unsigned long pgd_t;
 typedef unsigned long pgprot_t;
 
 #define pte_val(x)      (x)
 #define pmd_val(x)      (x)
-#define pgd_val(x)	((x)[0])
+#define pgd_val(x)      (x)
 #define pgprot_val(x)   (x)
 
 #define __pte(x)        (x)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
