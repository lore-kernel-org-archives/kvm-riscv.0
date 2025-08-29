Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D4CCA0FF9
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nf7vC8VHPwj9oJX+/chLrlizrDClb2EBThI/Wb11Rs=; b=3UlseJzr0y7T/c
	59/8Pp0VM1BI5PFOyNGClSQ/RHOSxV22sIlqpmIsfkQ8P1kHIFA6USQMIZw+jpm+mglyGUQtgW77i
	gDpYsZTFsE+23a8SW6+zDOz2f9yJGFPAm7x+5bcyKgjoxafSoVSQMJZnIUiQhCXB85OeIoiHYFbJx
	8uDhsJKRKaycXhi1U8493LbjaUMDZEj7/HatEQrdTt3ggncXG7YkMDETUe9e25ln1LQ6TirMMIrAO
	/XiR/JHZq8IVNu+7tm6mhvWPmz8M4+hdXQY7P3NZc7yWCJxRQinnEDN/zIQaX1n82Bzk7aj/RAmbJ
	gobH9LzZKC17rstuv9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4vN-00000006mcl-2KVi;
	Fri, 29 Aug 2025 19:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Me-00000006Sgg-0LrF
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 16:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756486449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEXEQ52BMDj9IaYiI6bg5Gi6IB7kkAuqnXds+BbFlw8=;
	b=VursuOOOmKGZ58bYcdA1ETgQ6iwzCvzWBMIKVSgR/V38iUa7Yf11kbnsOpjCSiPRRusJ7M
	eKa5l2vg+qP1CFH8TB4zBhpc7WBnODi5xgCADXaHlvGhcSUmbmGT/vCSd8OZgUPOu5gwNk
	JWhML5+DAaaTQF4+l9qXuWQYKhIHFH0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-PH3AGN1rM668MsWlTLKlWQ-1; Fri, 29 Aug 2025 12:54:07 -0400
X-MC-Unique: PH3AGN1rM668MsWlTLKlWQ-1
X-Mimecast-MFC-AGG-ID: PH3AGN1rM668MsWlTLKlWQ_1756486446
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3d17731acb6so161770f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 09:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486446; x=1757091246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEXEQ52BMDj9IaYiI6bg5Gi6IB7kkAuqnXds+BbFlw8=;
        b=KIFPybwI3FNDzG6d5vph2AD5WFE1ii/3bcy7e2ka/Y4j4vAi7526C4IcWwUXwndOYD
         l3p2ILBfeOam7hm+TDy3herogCcMVCwSFTsR2KI/vaoQyIEuHfWnoqbS6LxchIcOXWrw
         k6UfRenQPefsuiNsm3ukIm8HC0l0gRRtxfNrt3OIzkkRjOMudJgd4rUylSdjHvwVJu01
         pGjWE7LRAUjqzFwEv+ESzQPsnNvoUbP8+meDnusongq97K/jDK5spUesKzB9AzancIlV
         WmKKSqWLlDbW94SFFlo4Uth2+tZhpdaaqJi0lECziytww2M5wA6AdKcRExhDb5YarbkP
         vUOA==
X-Forwarded-Encrypted: i=1; AJvYcCW6E7MVjJLPtW7EI+0TQkC4LW5mnTnuIYiB2n8NTh8+EjikswUrCnKhCBkpMkfrqP/09eiWc1Ar8Ko=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh+hmmllfMhofHcR3j1BxDyuDVry4CLduwJyPjfgZwzelGwPvN
	/E0D018vcWYxSOUU47hE2W6BU7rOLCl5KLQwzdtllFBCyrzOBNPPJLhG0ru+a7JDDeUJP0yIfEc
	g7k+9dRudyDbp+pydj9w9nTnbvwiIC02E1AmjQ5TlOCjdnv2dId9hy/QJ/EzFZnvFMYLWnCw/ue
	0TxomHozltcedABUOpFYVbdZ8mreSBWGs6sGBprBTPhg==
X-Gm-Gg: ASbGncs+W5tmUr24OdHLBPvn3BiQJEDHEz87RPc3IQdZBk7Ak9ce+xJn7G2hAcGKHZq
	RHLNIFr9kPX9yPGRa38fSwE6Qg+gqqdQ910yulWh7ahKiAEFUVcK4YKnJNt/10sTFzE6JEwdblr
	xKkm00DfEebEvdIjQAE1KOJ63WZs0V7RfYcTU2NFpPBICfHspRRKjRP7iN6mYZK0YQioESHU5uW
	4ez1X/FSQ7ko1JAruUv5Ho4
X-Received: by 2002:a05:6000:26cf:b0:3d0:affe:ed78 with SMTP id ffacd0b85a97d-3d0affef23dmr1993388f8f.48.1756486445952;
        Fri, 29 Aug 2025 09:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdPZurYZfRUBnVOaS3PNxkM1C7NRZdnWpueO3B3+j122HOFXUPtz6Qia0NiP/HNj/vT0GqByycZDJiM0JglWc=
X-Received: by 2002:a05:6000:26cf:b0:3d0:affe:ed78 with SMTP id
 ffacd0b85a97d-3d0affef23dmr1993361f8f.48.1756486445512; Fri, 29 Aug 2025
 09:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0c5tScwHk8iLoF39dxFUSLg1RzST9=4EQ3C8KogvbM6w@mail.gmail.com>
In-Reply-To: <CAAhSdy0c5tScwHk8iLoF39dxFUSLg1RzST9=4EQ3C8KogvbM6w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 29 Aug 2025 18:53:46 +0200
X-Gm-Features: Ac12FXyqjT6P2FLFlcMv7sZgiRuRQCFuk8fcYFJD6RjPe2yyKjWPc-kMv7i27Zw
Message-ID: <CABgObfa6b32FtpDwe-DDqHF_xx9vwePKj2CtN7wjG5s-pU2uMQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.17 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: beU9icauQ7_9UQsRGEjNGru5wbSINitKyh6s5Lm9OMI_1756486446
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095412_192319_F425B567 
X-CRM114-Status: UNSURE (   8.69  )
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

T24gRnJpLCBBdWcgMjksIDIwMjUgYXQgMjowM+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRocmVlIGZpeGVzIGZv
ciB0aGUgNi4xNyBrZXJuZWwuIFR3byBvZiB0aGVzZSBhcmUKPiBjcml0aWNhbCBmaXhlcyBpbiBr
dm1fcmlzY3ZfZ3N0YWdlX2lvcmVtYXAoKSBhbmQgc2V0dGluZwo+IHZsZW5iIHZpYSBPTkVfUkVH
IHdoZXJlYXMgdGhlIHRoaXJkIG9uZSBpcyBhIHRyaXZpYWwgZml4Cj4gaW4gY29tbWVudHMgb2Yg
a3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMoKS4KPgo+IFBsZWFzZSBwdWxsLgoKRG9uZSwg
dGhhbmtzLgoKUGFvbG8KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
