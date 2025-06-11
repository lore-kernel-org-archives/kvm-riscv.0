Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BDBC677C4
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuqKiazlL8gETHEEUXnGPX/F7QAS7fDPEue5W8w7hqo=; b=K5Ro4/giIjXYW8
	MbFC3ByewgKDTd6vBQr0XIcbbGoreVX7Oowt/REv3rWuDtomr0tE4U8avSw5N+RAcX0XTdtpmfq1K
	Ydbpx5NYRAbVl0GztEXbNk2/yG0KdUTGen7+n7uYWKscKKwraCt7nm6ik0S9jR77wuSeSvrDtYVE2
	AtHiQSMI4Fk6M4Cfk/8xsc7vv8kF3+DJgFCqtHcvfDqfgJImbgBb7fU74wuQyjg+shdlQWChahjAe
	K4ys5Fg6uJ3Nq6jIFSDE4tQNzSMZ7UIOHaCL0K7itD4drO2FORzmFH6q+8pfd/2ly4r4WzHTqfHnn
	in4jmpgB+1kgJk++FLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9IF-00000008Tt3-3rnH;
	Wed, 11 Jun 2025 00:26:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93W-00000008SF0-02GF
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=; b=S3GECvz51tR3tICsjTxGIwmtc0
	F7mmd/Xd2dQbtGzltkZlejl36NJrNEdVzzFcROAHMeQYHCrsQbfvUyGRNplfdc7dAWo1xvTwmoxSn
	2YJNX44tANexj9sC1UOhVVIEu/gmIdDToQWJPsXK2RxgCMLA5n7M82emcL7GFK1Zy9KCgw9xdEXHp
	g0YzNkSQCOIaFTsigIw0xKAqXScDt9/Wy2axHM+PLUAXQjtshqCoviciBHF4knZXdjQ0zO6ZKaP/Y
	EFYG0W3Vv/r5n9AZ6gYUeWkBpMLHUMSOb++jcPX9YkLuXMiYhNHrUH2jM7PxJDW6tv4Xlb8W3zO+C
	cM8SW5og==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93S-000000022TK-2de6
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:11:01 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso5273453a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600655; x=1750205455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=FsKjSjE1YRSA1K5Wy4e1VWNhQv4ZPdBjzpq6kYNP9Loecp+r9Qg8U5amXMEHF0S8uz
         Xf+x/GOpr+G31LKDPwSHy49ymuEC42PbpitckuGdP9BRtCZ1oyENliUfjlhf9kjhY7ah
         3GH5Z5HSmY4Cpf4OK+BaHFSxR/k8Vhk/+2lBtutASlI4Jh5mHkfXyxqmTGLPi4b8Y9LS
         G96Wv5z0V+4JY85AZq8dILCibNEQ9DmcXP++L6ER7onqq7Q9/8p2jGz2YqVTP/VIvIyI
         HoEnuNJ4yXNNRT/BmC3l64hoCy1W4I0p6XVSo//GzBCN7aoA/tU1z1sTQGIEToAU0tyt
         N/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600655; x=1750205455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=dGg5OkTCVYOcEyFoRcvkV9QJqeg9IKVoZd2m3KbHx+Amdj8FhST/Iqird0Y2wSwdx6
         WVslwwg/TWU9KMNnrxNcY5z5teZ9RSc56v0BsW6pHDt/x7gYtEIkl+kB+gOnzjX/l85a
         M98c3prRrV9GuBGXRCoxocQBbSQKVowaCPkc5T1c9ExHRFV1qCYRv+aE3E7cJZUt0E6l
         wPFAEisvxtQU+kck34OG5Z9bGDwiPlOUtUgnBYa7Dkeu5EWMBYaeN2sibpeMDlCmPDXl
         YOniIesC6a9LMXSsKngm9EZ89spNvHrcZNKvM5vYZXx4CN3efvLx2EQ3wknk8pGfgHYx
         N7HA==
X-Forwarded-Encrypted: i=1; AJvYcCXG4jfnhCKkPojoTaq6aAs8AjzFbD191gK6WzIAE0y51S2ltjKmOljh3FHSETbpiFTeQ4GInXV4/fQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbkTM3u2fpyFwp2ffyZJ1PmNWHpQWxumC/WqMJy7N8gAvWtiOC
	5uVpuSj47wLqML/fvQoncbttAryTUVdhyYPwgK29G5J2TgLeqRiFaysIyTtGaI8p4StOgO6f9f7
	fBLUAyA==
X-Google-Smtp-Source: AGHT+IFPf4zAcxMmKYyJF/0q0QWOeyyNBeEfAEV8gqM1cGbYGy338sgO6izo7nZMoEiNEzX0yDZpDSCyFlg=
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:311:f30b:c21
 with SMTP id 98e67ed59e1d1-313af243a50mr1534626a91.26.1749600655513; Tue, 10
 Jun 2025 17:10:55 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:40 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: PPC: Stop adding virt/kvm to the arch include path
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
X-CRM114-CacheID: sfid-20250611_011058_754066_3EC35008 
X-CRM114-Status: UNSURE (   9.88  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..1a575db2666e 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
