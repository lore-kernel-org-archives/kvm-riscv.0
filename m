Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30C2C71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzL1Eh+MsgVfYsmxUvOb7TMeCHldVLZWaEJvZ5p/uVA=; b=lFKkOVyaDtD2Pr
	iir7NAvX0/PKpCIqcmKj5gdqIybHfemXgKoI0gINOB42/Np8ilduSzrGXnJZktuSztVJkEaJcjNvW
	3WNROJqR2qbm5QUL4Dw1tW9eE2G9BhXUWusFWGZ2Es8QBVkyKk+i/ii5Vd00DZDSYE3AYS4o84zYH
	fwAWCil/ZScg0MNpdcndA0IRit8KW0MZ4/1IkTb2EuBXvFuVrtdvXLoUm1WKuNU72dHTIp3aEzF/D
	OzPV3HeeIAKgpOEpDsixmUsJjk0G5P3b6fpFT3vWoBbTgX0CyiQc3tu3vlkagPav+D+3SV51292vH
	wEhROlFy/WZcXXpgNo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0vF-0000000Fw7j-3bD8;
	Fri, 13 Jun 2025 09:42:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMl-0000000FXRh-02G2
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-31329098ae8so1578362a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797898; x=1750402698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=Fg7F88hlgQTX7480gcqGKFB0cwzcul6ElaZuwEaJpPjHY43ssGtkV92RVManonQpDl
         A7on6F/lAcK3+7Aky592hljyNVH8CPP8UB4IsCnK5Pl0xEC+PYWr60Z3IHYomiUJZblC
         qiI+8+MBupv9xqAE/f5kmFXTovGjTQSj1oB2POS7OMgjtJp4P35Ft7QjqaXVyXMl+nVw
         eh2rTT9gzCvhrl4Qp69HF0onO4cqgzvOy89Y1H/CEcYfkIPTLlvqHYAEBCShQHf00ivw
         1ebnwR+J9qYEkp0f38KbmalauTSuWaLUzqksFWhvJ+8qKYplTCUSM9Pq0fUnzADH99Sk
         kb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797898; x=1750402698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=l0urjIZfpf6h5czOLRUOnKIKGK7WMEBBf2IokKhkuI0ORmqRwyhC3vo3/iQw7xVtcj
         Pdy/etVjSK/C24zrw8Lk/uMoePMvZJATK6zdmY1dcNYyimwWdbiJV5NFLBKAx+XP2Avs
         kjN+TZU3Bsawjtz2z/p3cvlI4GkgLUEA1NcGX9I/AJzkZi9G0gy3j8CAiYHiO47i/PHR
         veoW0HkcaEZYJe54R9AQd9jRWtQ2KOEmUaSDbz5ecO18v+5linAc0571tJezrofPj7T2
         lNaHdso5IBHOpHaoET1+fgeqEccg5YS6lKuUcIPnaMvXyXaTLOXlQwBebtQ+oJ02MTbB
         CkUg==
X-Forwarded-Encrypted: i=1; AJvYcCUugwspzyeGEVyQ0YFePgP5bV184BvR+rnTegYzdBm3txg4GzrwhzeO1wv3bM8tFdvijneoHc2o2rE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZGdmGkhOPMrWmzZLFQR56QDJhPJwcb04an2kw+C90KE6CrEE
	Uet16JvpDJCGgAJogqFJbLtsWCyTxOTIG0mW6P6wSlqxPgslFiZEuhSJTZ3Le3Azrlc=
X-Gm-Gg: ASbGnctenL/hhUATDN/Bp6EaZOUIN6qL7YSgscQvENwzh8kHpAGY9HrbB47ERax1ahL
	bt7/K/1a7MfC5iUU8fSfnz2X7xSwuwK5Fbu8qg+yYfguLWa8hP1+i9hrMLS5W2XczIFjS+65JeB
	RLs+ePaHG9e4OzeR7CEu0AaoGlsKdPlnCkupmHSd6GcuYqcvHhAixHAj1hitDnfuuTElISlefFf
	vJDkOZ4tyrMqKvceyQqhzXXDOEOMj0mqd/rr4kVr8gBaN2mlZq6ML8+BiEneXFUciMHy8jnjIjN
	t2oyn+ug8/s/4QvYuD8gQ8Px/LjZGMcFiOC5qOCNmjfz0zPM+OHtK3hXnmBPqoUhZIyTWpEds6Z
	T8OQdDI/9mLuub2WVIVo=
X-Google-Smtp-Source: AGHT+IHlesOh77cakTH2YhHv43j8zOza0rZEzGZ+37qo1i6wlvyL7TrOfPOjUkpSesJgnyG08PjCmA==
X-Received: by 2002:a17:90b:1256:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-313dc25631cmr1682026a91.14.1749797897914;
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Date: Fri, 13 Jun 2025 12:27:36 +0530
Message-ID: <20250613065743.737102-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235819_052114_C114C841 
X-CRM114-Status: GOOD (  11.37  )
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

The gstage_set_pte() and gstage_op_pte() should flush TLB only when
a leaf PTE changes so that unnecessary TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..29f1bd853a66 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
-	pte_t *next_ptep;
+	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 
@@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
+		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		gstage_remote_tlb_flush(kvm, ptep_level, addr);
+		if (pte_val(*ptep) != pte_val(old_pte))
+			gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
