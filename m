Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFE510854AA
	for <kvm-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lFg5OclYVQ6y/pYy5R9BHF0Zs4bGxO3lhqBHASSQ3Zc=; b=vdn+LrDsr8OP8L
	t7ZGIiGpcTg4pUs14z9fYmAZzQ6uaGFdk69pAF7e6LSEbNUvclb8YQDtKbz7SUHKTJYyR5pLyBWkA
	J6cCFbSjUMMVnq07I1niumdhJbazzZSeuRKoRRpzdoC5b08fKidC1ORDzaTHB8n711Mjz0621XHE9
	9Ik1vsVlPVXndpz9KACwVUTYRZofqwjCyvgYHlI39WVxIO/ORbVfum3Ehntc7j7AszsJkPfNdcxFe
	VtxJKoEjdH8hBdT7IugezcO4Sv0WozFSf/67IdEsIPW5fIqTzfb7zZl0vwCNAVB15Aypp0mJCN+SJ
	WAj3YZ3rSv7GAQVJz21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XWS-00000002DCZ-3p6P;
	Sat, 14 Mar 2026 22:31:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XWR-00000002DBU-0PZl
	for kvm-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 22:31:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so20221785e9.0
        for <kvm-riscv@lists.infradead.org>; Sat, 14 Mar 2026 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773527509; x=1774132309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ7hVQIRD6vEHOsR3AJFX+E3NnIhhIwHbuPfNg+Gnww=;
        b=HDYRXVuzVSqWAllakJ5MNNmn+GN93Ug34p6qJiPF0NafABVJo3w8T1WSKHwrFi7Euw
         AlFBVhV1g2P9wGXtvN80DF+SY6OpFf+GJ3bH8tT8WJFwJXY/0ll1I5LF/5YMco7kDllf
         CSWANvZejrT9h3hF182QvO/vXPZzxkg3d9FIbQQlFxMVcAePF/hBnHrAhOdZVhZB3ADV
         f4LqX9ur7iB2BxOnWoRrQijLXitqE1NeVfQGdsxq/yUmL5RsIs46I/zTJpz0hrXl9Rxl
         28PblawtqygTHxON6vROrx6DPoVQS2lgcHFxNpcMB1ntFbBaFyT5jMkZ+lDIYenHFEhJ
         qcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773527509; x=1774132309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ7hVQIRD6vEHOsR3AJFX+E3NnIhhIwHbuPfNg+Gnww=;
        b=IT2qFfernjw+64PL3ALtQHl2WHfxLXH57TvwPzNiPx2w7bAs3/Y3A8puIfuJU9LHqy
         vS8PYZ4WnUoCT2WgbrL5FFpW172sOhRuyuEWPEXJIievCwuLdnRG+u5tthL+tVtixENR
         MjDKgzMuJRgrEJjTxb0vIx64RNjqYH+Yu1Q67kwFdgntydFP2VNIeKUDIghpNj/Ui96T
         +mDVqv1ljSnVb87ZjjBefiwobGwKBT84HwSA4fVNeDfPCTFcIcUEkwaOXdFN+4CBtf9w
         9Q8fvfho9weKJQd9E8CsnQFbRK9mvMc5TPpU5rxxSWzKFqwL1TDky6GXcX+51QzZ2YZS
         mKGw==
X-Forwarded-Encrypted: i=1; AJvYcCVAlWBYRAVpwTadBzdYvb6VA90uVuHXSqh7DT4N/bOX4z6rPqXI9Gjp4tcQWmCPE1ofk5Jv7W//2+A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxioKThzvcMzPpcsEtcc2aTPrk9y9ytWdF7G8kt9jakm2lJ2zEw
	w9B9+QjPDQum/dEd3Zz8dEY0P0CBwKT5+J8X392B+C2yvOiA5C8G6RJ/
X-Gm-Gg: ATEYQzyUSmf69waR/Cle3pG/e+shysEmjUEA41p4uqXzjcnZvcEyl0W7O9D9XQDiTxM
	RuI5uV9ovcpq8XMKxP1ZIb5QBLJo3190XWQOVLmAgt5zDdD00LicL5xMeX0rLgFa3OwBXd/sxs5
	0ClcEAyN/iTpTicgCXRXEMlgHEGfmcer20VtsHZFQbKrvugS+0ZjJ9B7DwHqM0TMwpni2ENtNI7
	zE6PCR7DlhDmdIQuu/sGtATGAvAtWuiDsypF2TvNCzuwIUmKjRWUbwvVHijFjelMAelUxilicWv
	X09j/TUiiY3HCUacgJ9KFcNN32+b0ukbjYsfLE0BKoVS+mpHi7qFE8fKUcwDBoZZfmEag5IOJx/
	3DQ00gvPxcKSrSkPoKtK5OgpPIM2yUyjVOHx9rJzh/sTIzJZ3g1UrN8LXEmJIc3DXPAdmNnav9S
	Lm/Ts41cx/ufMsxHhMTv0/cxf5WAXOmWh6OjUEpU3UdcLpxrPJh1UlnAZ99mv6EUE4sZqQ/Q==
X-Received: by 2002:a05:600c:6287:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-485566d2ff2mr132595095e9.11.1773527508820;
        Sat, 14 Mar 2026 15:31:48 -0700 (PDT)
Received: from osama.. ([41.238.114.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm149314455e9.7.2026.03.14.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:31:48 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] riscv: kvm: fix vector context allocation leak
Date: Sat, 14 Mar 2026 23:31:43 +0100
Message-ID: <20260314223144.154349-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_153151_140550_FA1A8AAD 
X-CRM114-Status: GOOD (  10.12  )
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

When the second kzalloc (host_context.vector.datap) fails in
kvm_riscv_vcpu_alloc_vector_context, the first allocation
(guest_context.vector.datap) is leaked. Free it before returning.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_vector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..5b6ad82d47be 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -80,8 +80,11 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
-	if (!vcpu->arch.host_context.vector.datap)
+	if (!vcpu->arch.host_context.vector.datap) {
+		kfree(vcpu->arch.guest_context.vector.datap);
+		vcpu->arch.guest_context.vector.datap = NULL;
 		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
