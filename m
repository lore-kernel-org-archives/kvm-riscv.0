Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050A0C677C4
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae7brZKHrFAxo/0GPblBp187l7I0RPZFSv6o6IWGXrs=; b=s27PNmhlD/kh6k
	vAUApkXaSYIlYXHcvkavXqiCOJk/0WHBEkNExUecnu1LC9nSobVs9sGkmID/lvdPlcUrO126eRVtL
	TxJ9ptTIwmLGiyVrjfiUNAc1w232IEc2JKwVoET2yIwkcUSvqONgOlEX6Jz+raQzRO0wBG5HMSzXg
	jjnxua99suJCrN7mJSBOA6B+YtK481XwyqlNSJXbUtUyXWFS58nFg05FpgkXTx1JPBFzHK809U6Ge
	u1QKF9nOhLCHqtuqTEdxsO6ve1egHdIS1Vb1GMaKEHC+Hy43qhiC02h4M57Qs4ZhEXKQcFfywnRxR
	InlhOE6NUrSYSgS8z8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9KN-00000008UAW-3BbE;
	Wed, 11 Jun 2025 00:28:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93X-00000008SFP-0WWJ
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 00:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=; b=Pe4XpWdzTQ+1aWHwAWnzkVnTyv
	ofr4PGFe4+MXB2dDjfGlnvhna9YqFVF1TD8B7nrOVaUUxYNb5AMKgxSbL+OSr1n4lBPXN6NP6UpQQ
	9vUtn+Mq8MVKXQ2d0rnGeWq3RUScuHfKXEF1wOKWBF4A9TZwUkb9QIoaM5eJax4xf9fu79trDzGoi
	Nhm1skkn5+qhcRQSH7d8RPRrBAlD10Y278ON33mUqruvjX62jBBAqNoACOOigMBfZqC4wum2O4L+0
	Wfub6PA0h2DJcOJgNJ9FE8maGRFJ7kVnc9EQ54w+spmT7pOOC/P62hjDTVYbx7giIgDlDkGKg+kSj
	HCKIK20Q==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93U-000000022UI-3rzJ
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:11:02 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b26cdc70befso4024504a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600657; x=1750205457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=toDodBwHOgmoWdmI9T0U/bcaQ00c6ii2Dh1HxcPH79y6LZyKmplIjIFqnYTxU8Qus7
         VfTa7jY5UkACe3m4mwtQ2cN28HpzCZqzHqEFn/zEM9FU18yn6trnI09D1SSW63JxwU5q
         jb8lcnglUWHSggJc9kUIFD30nUqCUgYxQU5Mlv6Y06Z8Z/9PU3OpgBvja5F/bkqLCMVT
         rXMBfs0DLlZ5HB16NPLvHugI89kb8jcxbmMWNE7M52RKy5CtY7h5Xi72PX7ZFM8XkslS
         bPUUM3BurFrLh5AzTIkDLZ6YlvOmuzcO/qNnzf4I1bpcbTdFK34DpdIU2FxiZxSMKoxY
         PIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600657; x=1750205457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=pAb/QNhDWMKOFrBhr2oFh/MMdjOaBuoW3ZtwtspJuKmtqdmrnKfzQCNt4+yajfVYJ+
         2BYqvbbeSuKA2cFvoi/Ag3pvd1FklW0JiZHUl93y2xKgyin9mDWR1Fw/Q2uQLOY8TKol
         y+Qjb6ZvUY/Rz5WNFQ2JoeNQMEvNMFGvi4Ztd8zqH1d+8koZ25LhQU4QquQ9B4gAQytq
         18R3QBEzfn9K2xrIhus0EJpQzdNy1Pk/nt4dqwJhAoFCl2KWkfDHoDzDAVU2hMXw1qk9
         tJQY4quEwQ0AQk++XSgAge6qSyGnByFH0KM8OKHjysxV/uPKvyhSdFbocLeJTm15AfDD
         acgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw1UXhTaxp5l1+sNp1VIRg2jMEsAF6Nta3dEHPAOawCnqrZlo/Gw2qXqGAxqnPd1Mrtj4ldotMa00=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWSSqdUppstiAcIwG56vuqcHDrTOoNcP13c7iwzbNkPuYAz163
	Lo0srX68nvZQHedP5hOjZtGFRy8R2Fd8NPlc5/8v71eYAlAN0XmIACwagS62X/4vUljDOuBANZj
	zQ243Xg==
X-Google-Smtp-Source: AGHT+IEo+A1iKKp/d15/c3Y8CK62vwTvYQUmq5gUOhKzuXVKftWt1+9sRfxp1GZ6dnQl+d5j2tHzGoYEsqQ=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2643:b0:312:29e:9ec9
 with SMTP id 98e67ed59e1d1-313af1dd043mr2232849a91.24.1749600657225; Tue, 10
 Jun 2025 17:10:57 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:41 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: s390: Stop adding virt/kvm to the arch include path
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
X-CRM114-CacheID: sfid-20250611_011101_095175_F24CE6BC 
X-CRM114-Status: GOOD (  10.70  )
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

Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that s390 *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
Makefile when s390 support was first added.

The only headers in virt/kvm at the time were the x86 specific ioapic.h,
and iodev.h, neither of which shows up as an #include in the diff for the
commit range 37817f2982d0f..e976a2b997fc4.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 9a723c48b05a..b742e08c036b 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,7 +5,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
+ccflags-y := -Iarch/s390/kvm
 
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
