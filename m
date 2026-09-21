Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202E6C982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19uXqXkEbr3dG5lBOrtSCpOK6u78cl33VNM2/salyp0=; b=tVgDJLzpFMxSw4
	RPrBQnQDr0XzNcbqiO+Q/EH+hd7aNMeKAljwz9N99qVUwD3YR5USSbvi/FIF1NSK7Qzu2vzU+IyYB
	PmOPebQ6hfNqvzaZpHX4hDGtlAQy2ALAQ0Y2uKtKHUaGwbUcIGFfyxG9R6dAtIP2dd3DBpP0TTN9j
	XpxhFSpilL6dSPBFyEjECGOYvpud1QRnzQaLto+BzaMbDUEwcUDa7XZnJTa7rX+K9Cr88gBe6HemB
	BYpEKGCdXVk+gNvUMatY715fOlkysnulKqg9OJi+MoDu/aN5HdS4tjkfBWr3CHT5rdqHJ5ILyPtss
	eITpP5/Ha6lDdNJ8CrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byq-00000001qG3-3M16;
	Mon, 21 Sep 2026 11:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byk-00000001qCL-0bie
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=; b=rfE2PPERejvoD58XMYOALkA1kS
	gwutD+3XQwpPkglKcl8XyyAy9sq8NfZAfQAAC8hVL6PaSL53X+ITlYFndGOxpyuvDTCGcwuqeYTEq
	gTl/0bOYNw9edz7NL1FHhDvHNrRP05qXJW+v/EqFVcBee8sao3vi6X7QmOaDeozpDsk2Ur/zyFAYv
	aIJGUxCtfddafiuMiBKEbPh5ZDDVLHYbDIfid6UroFtOM/vs835JYUWtobdvaAAW/K887In+i1aAN
	hOurkjRjkW68E2KFASjHfC4SHu00sp+2OoAhxp8SCTR9d4okkklsomGLEM9BJc9/rF4P3q7lQn5d/
	yD/HZ/dw==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byg-0000000CB42-3P6X
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:32 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398cb5615deso3343711a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989269; x=1790594069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=eFV0MvHXWqDhAqKHsCYEGBJMzG8XcLKMiZSRiVSRZNFR6ksF7/KZwVA/rv11519cEh
         UQ2GgbaCPS1Evsd4pAYSybyQHz06FOWh+EObgJsL0L43/vagrgXmVEE936XV9B0BWT0m
         1Pf0p3Xbp+ya5KXw7OqJrpn8GwS7WFUOlwwZylTgCXkSiLOdpoV9QpTEE60nwSpyz6vu
         ZkCF52oOes9gCau1x3JK81afoYD7mawTcxhk71w7nb8P4ecUYC7312pdtAYM1rk3BTIM
         j0rpXwkY13bvGKSh4Wf9zvKN7OGo5Fa6sDLT+roTdy1kc0uvYvdnqeOXcaczBXehpr8C
         ObCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989269; x=1790594069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=IS8QsL58UqLOx7pp6rbBE5brikeEZ7bu+0b5q7NW47qmBpjPeotcvniq7R1HDFO/eT
         Jk6fBnOiSIQG/HnFm3My2fGN5qCphAez/enyP95Qyixve270Mpp9nVgoq/XO7NK2RbQb
         g6mPfmKszCUVQPZzUiZn6tVflRyuIcKqOGvZMv7PsbmLm2eCo3iw2qiToinKTyMI6eNt
         JKbOs5aIZj56m7ZbVeSBgkT3iAUVTqrnnWQBNEl9bD/kYiEze+5KFzIyLk6jGqsPn3io
         ihUwbob15fxBn2kflJwmQTR4gt/c3jvXA3Fbhp/PY7B9ct7pxH93Jus4S2P0I+P4EnqW
         Qxdg==
X-Forwarded-Encrypted: i=1; AKwUvBzvsMgJ7RO8dZD0wM29awNit91uTqxZ7RnqJGVyGukOEQQhu718k1Th4vX0L1v6dWvonTxCXLk2E/0=@lists.infradead.org
X-Gm-Message-State: AFuF++kMP0o3hdDclBWgKMK+tB9kMZnnw5G6fOUkNTJzkQ2p3yztKRc4
	/8WvrxV1+avAvR0KEoZNiHqZvBK+XjcKaCG/6p4QV85ZG8XzL1t0UzTT
X-Gm-Gg: AYBFou2tGtOlz4FwcS1a/hReP3SJI/XlOl/NIAh8ZOBMRnZFikxrNN9v1EIiVimXU5H
	jUd6BQE8Ta/TcnmKK5OboQFx35g6rsJZmDwjIMc9sda9sbNo2RDUS3S2Lc1TOhl4khnV1SEeT1J
	A5eRyIiWR7LYxwDalgIqcjkJ74IpjOe2T/dwPd7BsfqpmaX0W2UQ2c79D63pg+4/WJDZs2VoLIW
	Xc7CUvM1YagA4azXO26jr5lOn4zj7O6X+RoQjOd+or8UvBAhxtjc6zKvcQQQS20clX9EnUOKRjk
	Uy4vZP3QDfrO5odWcMBI0gJJ0vWLz/Hxc6nSab4k+dFse3bObt0vkjXQ/kQZ5TTPpP+DbPjH9Q9
	V1slVIgFnQO2sRzwiFqPehMJuQ0oqyLdhaRC2mhWuprNSn5f9uwd2xU3hvxmq6zCxfSm7MjnDDH
	NthJfsrcdk3fOLuz1S/vDrj7dL3BMc+mj4t2E6PdkndUXBgHBgFG7Hnj1grm28759ugeXjxbqqr
	MPsn2lCmUKJbnC1MHLyzw==
X-Received: by 2002:a17:90b:1cc8:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e54d703dbmr15998993a91.15.1789989268553;
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
Date: Mon, 21 Sep 2026 20:14:00 +0900
Message-ID: <20260921111402.120911-4-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121431_264030_6DA63771 
X-CRM114-Status: GOOD (  11.41  )
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

GSTAGE_OP_WP clears the W bit with a read-modify-write of the entire
PTE. Lockless aging can concurrently clear the Accessed bit, allowing
write-protection to overwrite the update with a stale PTE value.

Clear W atomically with test_and_clear_bit() so that concurrent
Accessed-bit updates are preserved. Its return value also preserves
the existing behavior of requesting a TLB flush only when W was
actually cleared.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/gstage.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 944fa4c95aea..f7e4756ce15b 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -378,7 +378,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
-	pte_t old_pte, pte, *next_ptep;
+	pte_t pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 	bool flush = false;
@@ -408,13 +408,16 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
-		old_pte = *ptep;
-		if (op == GSTAGE_OP_CLEAR)
+		if (op == GSTAGE_OP_CLEAR) {
 			set_pte(ptep, __pte(0));
-		else if (op == GSTAGE_OP_WP)
-			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		if (pte_val(*ptep) != pte_val(old_pte))
 			flush = true;
+		} else if (op == GSTAGE_OP_WP) {
+			/*
+			 * Clear W atomically to avoid clobbering a concurrent
+			 * Accessed-bit update by lockless aging.
+			 */
+			flush = test_and_clear_bit(__ffs(_PAGE_WRITE), &ptep->pte);
+		}
 	}
 
 	return flush;
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
