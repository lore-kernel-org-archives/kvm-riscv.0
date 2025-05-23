Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0CC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WgIE2xRA5mHWuGyx+BVPhI+ltFBjfKR6uTr2PNEPSk0=; b=PHZeS7TwsR6W4+
	3aG0UdT1YIXxGpsAC/AJYAWVuokKDRSkvVZrZGkl7Ki0XmfT6B35n6UPNHY6P2KjpJYVpPq4ioTdB
	4ADg5gZYizTnTJEXrQcpWsMtsxz9FfOr6XgiLSLxR4a5JvWNtXkyTYdOrke7TSDZRN6mXuL5tEuUH
	xg08ldCzeFl7LUot7cSf0eGPC1FRJGvuGa2Pig/vgvYyOSrzPe3GPW8QKN6xSMe9MOYPpWlYUdCKc
	tJz9JshAOtb1W/6JOP0/BCn9w8M4ykHzGCe7Eo0+0JoNIjsBf3pBMD4LRFxnjgSdp0HtOdCOQtzMc
	NN2B2Gq0FtJBHWi0q4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ0q-00000003dxV-0dt7;
	Fri, 23 May 2025 10:52:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ0p-00000003dxG-1CKC
	for kvm-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=; b=AsqDIVI+tW01Y++vMMrHjOf3tz
	plUDtZzo8nXS0PYO08yiGUgYKs1Zl7ep0ywOSyOlNNSr9JGRVlss8Hx0RV7PELGbUAsQAWGTWVyoG
	dofX71bipZuybR0+J7RzbSySTBq7DI//baicLygqoQokOw9fwtGTmBIVVOujEgjVjYJLyCBvyA/ct
	IuciUHTEL45mu4iIuE1kGuTuc+OYTVHhFQF7nK72t5tcXfKqZk+rK0oLCvsjRAomaSgd8cmN9NntW
	rXCTCUjTDsQp2tRaMwMA792owcR65iW8+OkoivQ33XN+ArtMhvgqOjfuckDHjf3fXFamvjqKlU/3y
	9MUyLH9Q==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIQ0l-00000001HDd-3iWA
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:52:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a374754e03so409768f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747997541; x=1748602341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=Wj78HTabR9FX54M85uadO+qXYI3YhWHIuM+Vic5akzlflJC6p5mGDdTwYQEHyalucE
         2tMfc4xFGNust08c4OMl3T+2NFX1QhsxCLhqZ7OykGAIEdmFDYZIDyKGXjB+AR+ajY67
         OGIzU/vKF1xaOqA1drbfIMwSctvdf1tPGZ5d8qTFrfkUFo52IC29rVOMSyLft5daxzIr
         TA9NgCKlJ3APumAliDMJjFrpaxRmvEX7FtAyiN0nQUt4/9FaQzYFsfK16SybRaZTskMN
         +36ZpXJRSeL2dwgi+Us7qjTFmgiIvJzjM7z6vaEEny2cDlxgadihSp4OYSXeE40InDtm
         suRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997541; x=1748602341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=Ar0uiUS6bhpbSuPaR5VdwSohv5rxmZjRhjtkg5S/GuDa7HJnzSwLDlKrN2sDWOvxLg
         8tapyaPAdn9cs0aoQ0QAeNq/mSw1K+A8e/2ciw9ZBlX/myc2SKDYxrvs8d3ek7B+vmPm
         Pdmb4OywtonLiJ02XGiAZUCxGth7DotZwhtdbw4Fq1sYWQz0HB0O85wvctwhydwulswb
         ZY1uvnmt4rcjp/J3lFie0FEbTYnlDF/dude9JJRITMwK97uwb9NLKKmTxydWuDaFha/t
         0MO3LK5HFIR2CJrZEyG3XWmfhFGKSpd1YjNQBbPgFBMTHIU6y/RjZ3G2xF9oHVVlASwL
         FyfA==
X-Gm-Message-State: AOJu0YxIYcDZ8tGJarxRHv1JbBIENGx0FUSyGB/FBA3I6nqpbDNKs+Bf
	0W0cXhnz6J6ww/lmQCecZIHeZTyTn20V/gCsYpHo+zSMHvq9GUtBHE4v214L9zim/95eM29StrM
	qQizs
X-Gm-Gg: ASbGnctRpCzQ6OGH4Jt+BlJWK3+4BrKYuILKaC3NwFP0IMuE94yNdkUQ4/FO19CUjMY
	Td7VGNitxUH4XMQqNTZ5AJZUAhOZN8sAz9pXu1qN6LRclmWwB+i9oSQjk5kIaKR3FBAvwX9sdH5
	73QviORhabEOfr/+ENzEs8CsyGRBzpYlO+hfv2OaIwJycrgpJ99YESouKcw6WbvAfaHK4kWjmd6
	tlEziNawJhpgtsBF/LbFc/wJRGYzD2SxwIfSXajUJnqG6d1+e0YRGbOrbRbOP/F+8KKyUEM9Bsd
	46OGuRwupnB3GmcIsOc6EjxWA9GpmNE/bvIg9oqfZ/abRWccSDaOeiSW+T4=
X-Google-Smtp-Source: AGHT+IEZmpBdHidSmMll0Tt/cMd2jy3jhCSZ/4z88K5W2YuxN+ezZzGMi4M3/53vgB32or4XtWGoCA==
X-Received: by 2002:a05:6000:1acc:b0:3a4:7373:7a6a with SMTP id ffacd0b85a97d-3a4c2e443a3mr745998f8f.10.1747997541137;
        Fri, 23 May 2025 03:52:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm25590521f8f.87.2025.05.23.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:52:20 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
Date: Fri, 23 May 2025 12:47:28 +0200
Message-ID: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_115224_035338_EDB1FE59 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

V2UncmUgd3JpdGluZyB0byAqdG1wLCBidXQgbG9ja2luZyAqdmNwdS4KCkZpeGVzOiAyMTIxY2Fk
ZWM0NWEgKCJSSVNDVjogS1ZNOiBJbnRyb2R1Y2UgbXBfc3RhdGVfbG9jayB0byBhdm9pZCBsb2Nr
IGludmVyc2lvbiIpClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50
YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMK
aW5kZXggMzFmZDNjYzk4ZDY2Li42ZTA5YjUxOGE1ZDEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwpAQCAtMTQzLDkg
KzE0Myw5IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N5c3RlbV9yZXNldChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCiAJc3RydWN0IGt2bV92Y3B1ICp0bXA7CiAKIAlrdm1fZm9yX2VhY2hfdmNw
dShpLCB0bXAsIHZjcHUtPmt2bSkgewotCQlzcGluX2xvY2soJnZjcHUtPmFyY2gubXBfc3RhdGVf
bG9jayk7CisJCXNwaW5fbG9jaygmdG1wLT5hcmNoLm1wX3N0YXRlX2xvY2spOwogCQlXUklURV9P
TkNFKHRtcC0+YXJjaC5tcF9zdGF0ZS5tcF9zdGF0ZSwgS1ZNX01QX1NUQVRFX1NUT1BQRUQpOwot
CQlzcGluX3VubG9jaygmdmNwdS0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKKwkJc3Bpbl91bmxvY2so
JnRtcC0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKIAl9CiAJa3ZtX21ha2VfYWxsX2NwdXNfcmVxdWVz
dCh2Y3B1LT5rdm0sIEtWTV9SRVFfU0xFRVApOwogCi0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
