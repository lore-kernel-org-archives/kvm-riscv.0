Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C8C43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qg79U4uwbXYzsXzM0Og+KP+256gdc3HRRB00wN0MRiE=; b=A8j55/+6ZeK+eC
	6KIhkLsd+H/zcHAS2AJyxTltg8IY7DbY1WQu9sfryOle1vd1hhpNJX1r1ghTNCXJBIWSDXhnmVRP9
	3I3BIgJk07cZdqn9Qjk1uOpAC/T0H1nF584q7XkxvN9JA3C8t05/PzWSHLVrsQMMZNkDhOjSedWgd
	ifnTtGOhs0mAcJd0n/dO6QWOEF5/uNm3K6/Fr8K7p1Z7WvKmoacojTMQFr8hY+FopnEXwgXPuk9Hn
	7cQREAoe2ED2L7Pewv1821y8nV5MxXlTL5qIaM0DGeSvD3f2z8nqY/xhWuZyrUp3EGe27AcZ8K5RX
	AbeH2AJab5ZbQKFD2dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepkn-00000000xnE-43j3;
	Wed, 01 Jul 2026 07:53:06 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepkk-00000000xmX-2CVX
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 07:53:04 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c96739a46acso131353a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892381; x=1783497181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puBKmxakpyuhyti8JVghjO1VLPpzeh7Dz9u+N6AR8/o=;
        b=XHo6KquhZUqPV1IBIIVPdM77Bg5Qx7PxNLxgy3KCWEjs8szl4eJqlYH4QmG1Hq94Ns
         JGqaiKkBtEJgcDNvLwBJE0Ynt8Hxj2cwE1eUMGzi1o9eAa4OktQujZA+LU65V0C5BdpN
         WZdgM3fSQehfBazzqLwd3et1WgjyQyq0dZ1RbDYj8TEnWwBd8IjiTVufJrI8YmjY5Z2i
         DfNbWSrg7C49h0YgBNqWqV5wtvgu1X0HgcR24X5qRi/vyzAj9i5bh8rliHPh4C8hXurP
         9n/ImXKp2h3uuUHN+YI+7Xq25SbsNvjfN4G5pJBcuz+sEiwPeIamBfzohaN+2YfEHe6I
         CM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892381; x=1783497181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puBKmxakpyuhyti8JVghjO1VLPpzeh7Dz9u+N6AR8/o=;
        b=IwIB08nh8ck3Oquyuk9IioYDaY+0XwtINgw2z4OO735iIjInt5wgFx3YISbI23NhVz
         5bUYplu0+8TO480fp5axYkCqobqZ18h9bdrD6IdDPJrYT5Mex/wpL+Nty3QNbyPHjljk
         orskSKZFDqlP/jrsVGHgsQA3I7MQwxrZec8y2IaXn4TouebfrVxlbANw6qOhiKbSKLmP
         kul4R6BZ3bjRM1k2lP93Zbo0UWlir2lZxGLvEPKRnTs+Ayqo28GrfHlFJOcNeG7Ka4/5
         tg0aWO+HPoWsImEybDfL7XpwnH60IJRxFdvwv8DYwbDPR2t5ffITW+sTkQ8cd5R2ssgK
         3rBg==
X-Forwarded-Encrypted: i=1; AHgh+RpuDPohH9zjvkaxlJohotoLmBIHfV3KmHJBxmXCHN0QXnQVu3dsg2Fv6zGXJEy/gIrzE7EN+qE8n6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFQuiRCiF6MiArQ95fHKSVfL79THtzhmeVlO0tj9NJaElmOTw/
	onYE+bdp6bXHI503/FkKyovrbpqVXHy84HHrXs27JpZYGHKAca7lP8ME
X-Gm-Gg: AfdE7cmF7aSC+3ObJT4r8I7jgl9pkz5fP7Mkq8pTsmmdI0aSPr17Y6QLMpQPDPTHJbK
	fy3g6dPvuqOSSNQK/fkp+NCXKS/iNO36TycrO7NagCil0/k6LDocd63YI2SvE3poRdNNubx+D1Y
	xatC5SrdBiubVgyolNztGouHZk6fDz4rXZogbThYre8khf/uo2gLfEigrvgih6sMWWoFbeWpOgF
	cA6yQVs8RWhND9pFBWTc7pNXWhfEvZRAa9kZJ8W0pIgHhTkn7V8bzZcqRRwdVYo+zNJxZom/M3C
	2yKT4H2fR2cKikEAqspzl5iQuMMbcw52Gw0m3q+kzrNltyxiTrEOCX+WS2t5UWrpjNGajLGkRAS
	KwlqTXOXCeDcmwXIN+9QYqW9JLDk0RsPcHVBagG4NRZKKk9mEsED4q6pXUeVAeMdzsefxUzHp3F
	ETcEg1vl3CoTt/EQOycuWoYKsBUUF8k6k=
X-Received: by 2002:a05:6a00:3d56:b0:845:e9e5:cdec with SMTP id d2e1a72fcca58-847c097e705mr532613b3a.62.1782892380950;
        Wed, 01 Jul 2026 00:53:00 -0700 (PDT)
Received: from wud.bbrouter ([2409:8a1e:9473:9f10:5de9:783b:c249:18c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8f959sm3608232b3a.3.2026.07.01.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:53:00 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: anup@brainfault.org,
	palmer@dabbelt.com
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	zhouquan@iscas.ac.cn,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH] riscv: kvm: Skip preventive hfence.gvma for new G-stage mappings with Svvptc
Date: Wed,  1 Jul 2026 03:52:39 -0400
Message-Id: <20260701075239.95542-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_005302_564983_7B73497B 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

For Invalid->Valid G-stage leaf PTE updates, the flush in
kvm_riscv_gstage_set_pte() is preventive. When Svvptc is available, new
valid PTEs become visible to the page-table walker within a bounded
time, so an immediate hfence.gvma is unnecessary.

Skip gstage_tlb_flush() for that case. Permission-restricting updates
continue to use the existing flush path.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/kvm/gstage.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index c4c3b7956..7b805112d 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_gstage.h>
+#include <asm/cpufeature.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_64BIT
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
@@ -171,8 +173,11 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	}
 
 	if (pte_val(*ptep) != pte_val(map->pte)) {
+		bool was_invalid = !pte_val(*ptep);
 		set_pte(ptep, map->pte);
-		if (gstage_pte_leaf(ptep))
+		if (gstage_pte_leaf(ptep) &&
+		    !(was_invalid &&
+		      riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)))
 			gstage_tlb_flush(gstage, current_level, map->addr);
 	}
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
