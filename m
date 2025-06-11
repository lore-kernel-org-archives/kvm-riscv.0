Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB4C61DB2
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVwEZE8tWLD3hyQxBH4dN0S8GCkUtqgyK9eSLFw+jvI=; b=sEoDbmCYC2//Yd
	1Qd+chxs3EBSLljUN+Qp3oAmw3Gi+i5PKiO6XpG2KF2/fTpCWEYf7MV6rGs9jneONr/arr0xFupV9
	zZXa5MEkYg2MyJ6qEvG+y+Jc2mMtRrnJCzMYpnTVf8b98JOpEQebOby2vOi5ckBIBBKvWD2n5WAb6
	axq92RYdpBfOyVx6DuNeBVane8VhQkVTvVNcDCEZdbcpjTNJbhAPSJpaefU8NHxen2AEY81uSJvzC
	pgSrFpsuzkdBgPfAhdLs+Q59op6rcQ8avOMHhpNxJMJk9k38eZbBJcqpdWC7mZiuFYlwr5ExEjQx3
	zMwnieKMnxeAjFRyiP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9G6-00000008TXV-37Bo;
	Wed, 11 Jun 2025 00:24:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93S-00000008SDm-2L4g
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=; b=DmWQ8DJXE03RDBpvCnmE8cmu5a
	WEgRqUTtpbQDGY3DfAZ+pXgVxZfexYyXx3CKfUF5hzAmLG+KWO21uzrvUyjVX01cjxF19cQX2UrAH
	/vEg4IJAmLHl7Dv7XYOsZqrHdksXl2GN/hJaOVOU6BqSqazmaonrnVoRAquD4quP7KuXlymUm4UZN
	sC4v83opHp6oz9/Li/+YddpUZy2re+33kPgOlXzYz7e8VrbhguQALZnilfsNWIIpo/KxyeUZzjgqK
	NpvKENy/8QmyXGzBZAJCwD7+9wFa4VTgtj6cXx77uS6WSMeIg1MV1f/jsncZFhgkl+PfdhYZ6DLxg
	bwNhOwSQ==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93Q-000000022St-2SYy
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5482509a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600654; x=1750205454; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=rHkHePtpxyRmtp02AYWGJ0+07wXY9Re5tUpG+5uWpFrcht3nV1C8K3hmQdSB77/s16
         jHF1q+fBGazF9QZg3N7F1+PwaTwLXcDV0ddndSyDIf8zZolPsTAcUJ85aBvqDNvfyO0P
         gKPe2jCfoxbVv0X52xSGP38CmaQYn68PwcjPaGNeqOUJF1LlUV7iD1744dhbxpmjskvQ
         a+HTF9dp8dXoXZ5Wp2yQwY6wr0hZCpYjNsLPEiGqKGSnqkeTP3La49Mi4ZLU5RUU19Oo
         Y7cet5iO7IOU5/3cQUeUBzMPWU2JILn9q0NBc/NX+fe4xnZvTVyRKmYGy9qxrTCpxDY8
         FRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600654; x=1750205454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=csE4dHOfXsIVIzV/+qBi5Vd1i/fs5soJwaSROht5gd0bMT9ld8pqm2jyVGZNscwsoa
         agCSQpkdIQtb6m9kahKOZAlTDG6k4x8Qq9JvXDew/RKQIb3k/60GIFDvzY7K4gOFkrLz
         PfLnfyCFW3J3MVviL8BOIcnw2o85PLlzVVLV/vxZHfCX/nTcODzVawj4QV+aosDWlRCP
         mVmBqha0pSKaWoTS+E85QRq/uBzQ47R+vmxZVvqaEFOh+ZdOMMb2z1Wm6VHju2Yw07Mb
         GsYBVRjZH5FqrpAwZinBS5Q35VXB3QAiLTTgSKGEqro6uPDP5fl95Kcpy6kQN/TfB83l
         U7ww==
X-Forwarded-Encrypted: i=1; AJvYcCVGMQbFBre5RbzL+3p7uhsH6MBwXg+OCBqCffe1+3r8TQhcZLNZqjc0+kRnJffBWsHNMNey/tTyG9M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMCMyNvDbzWKRYmlJh4J+HYygOvoODnyNqqF5topI7lLiT8Ixh
	Nw1aDzmB5yST429igMbv8x1f/v9uTn1JTNVe2RSbVKBMbdrUy9EEyKtAUQ+1ZkGzmqsjbswCwee
	lGV922g==
X-Google-Smtp-Source: AGHT+IED4B4s7Ytoor8mnhgXxSS0ZKiCE28nENLHgtxurTVkQjPNLlNungxBpASYaT+z3Y4fvBlDrrKUUDc=
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc4:b0:312:26d9:d5b2
 with SMTP id 98e67ed59e1d1-313b1d9c310mr956755a91.0.1749600653718; Tue, 10
 Jun 2025 17:10:53 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:39 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-6-seanjc@google.com>
Subject: [PATCH 5/8] KVM: MIPS: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011056_689324_DDCB2037 
X-CRM114-Status: GOOD (  10.65  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Don't add virt/kvm to KVM MIPS' include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that MIPS *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when MIPS support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..96a7cd21b140 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Iarch/mips/kvm
 
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
