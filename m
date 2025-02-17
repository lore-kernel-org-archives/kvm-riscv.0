Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B587C021A1
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FGOJO53ZpLTuwwcYZiBKCd0kki01xW5l1vgfJZ0Dvc=; b=iyOSZebwLpWs/6
	3oywWbQK45WCdaRrFVGh9E4CCMnzzH2ogPMPy83k+gUYuWKIkF2KCHFK67wfhGKclgBI6WoB6t1RQ
	z1shSNEURKrGjgyDalw6ZSISEi5ho7tcXJxX4cOJfQ13fA5LtaVeZVblLn2nbAeqs+Yohq5VDBcoG
	ngup9ZMlq6eQGHxa8YFAUvKr7kr0+xfSmZt48R3GaEl9Ws3WKFCNYlun74HhV/9EUIs3B8msTmdFR
	r0IFlCDk5SmvwP1yJV5WnuTG7jh5hZyVvZ+mjA3E+Iicq/W4tFZJBhXiahYz8iE84k4s9TU9LOXDZ
	W4Cx7WjmRzUckjWC2xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyls-00000004CuK-2uWJ;
	Mon, 17 Feb 2025 10:54:40 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjybp-000000049TF-24Xq
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:44:18 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d14811cabfso14115035ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739789056; x=1740393856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEC9IKTHffK3WvFzTVA0qo6PFNnuHBV9vhhQNHZZ8nE=;
        b=h1AcqMP+mMJRzisY41GwnL9L1kY9KEqMJL9/vFxL2hC27sUASZhR/PLloRR7XCUjal
         kVpFIp/YGQpysnbjk7aYZz0NREw0J+HeLqf1u305JvRqV27cPax3ht1ylods5+e/zN0/
         CsXMG26mNPh0NkOCiPNHf3UMXmVAsXi6eMBMG52amsQQ+Ob+0mzGA7DUB6ZkrwtEHmEH
         RCxX02WfMM0rv/DFnQJTnmXXhsocS60BeabQQew79Dl/f09foezlRbfVUf5AgZ3FWknw
         YaALaQSAlZhO9BASQIKQPTX2w1ZAfBXcFG2o43oAQR8mcsSE99IzbJ0heK24pDQwid9Q
         jnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789056; x=1740393856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEC9IKTHffK3WvFzTVA0qo6PFNnuHBV9vhhQNHZZ8nE=;
        b=dhyRFcL0Drmj3EeHerb1zIPS8iAtSHrP6O1Aurv1YeYvx9srejPZf739+DRFnJioON
         86etes2DJFcz/aU4xLp8OaBw46z0CPyHXEySk+o4wUIYUJMVMAhxI/ztu9CzTtU/5Sgb
         zL/JoRt/L0L8XGz6hAz9qYF2tV6D7QIEGY9hQzEnVhlqRo34x2I0/ODqC5u+NPtJIMl3
         NLRd5cZ2Gr3rskCSmMp2P794mzuOfOxHSTOmDz4OOjCy695uAAsSrDWE0Y70NpSCxtto
         E8rftzaZljHg3SWYVCruortpbgHMMbfA6wXz4CbVOtDAbSaV5k+GExmtAd2uI2p3gBTw
         DABA==
X-Forwarded-Encrypted: i=1; AJvYcCUeZOWviJVaQG2rvSNoVt+Ha8VWbdtnffN7TAuC3os4yCfIZXZouwNQ0FKzLF1WVog26tj/4ppNBCw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzee+2Nupm9D6fu6oVps4qiBRGikH9Zw7Bx+IaU5dkfvq+qbpKw
	UF2Se1kDjTewAIoHT9qCF1PRIQW+teoJmWtKPJnrYa0RJHI8rW7mB7FB71YKK8OBs83BcOggzXc
	ALkaGLrUGE3aFYq2aDc8WXWuKGbGlrZU9+v41pQ==
X-Gm-Gg: ASbGncu+lvS5Y23R3dM7Gv6EhhWI4lH1umh6kCsgdMvJbJoroIGF6D8JyUFH/jt/jcD
	2RNu4ecQTYN9wQCdIN0VWRl1AmzW4BH7mkosA1nEXajjELJDmN0ExmRTyH+8xX+nKo15HQPsurA
	==
X-Google-Smtp-Source: AGHT+IEx965Kes7J9PFe/fEC2qu7c1lQXF8r1O+rb4FsIYIqeAylTS8U1CDqrpwteAP6QAUGVznUvUBjnd38LJ5N3iE=
X-Received: by 2002:a05:6e02:2181:b0:3d1:4b97:4f2d with SMTP id
 e9e14a558f8ab-3d280763f51mr58551715ab.5.1739789056483; Mon, 17 Feb 2025
 02:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-11-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-11-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:14:05 +0530
X-Gm-Features: AWEUYZkbD0BHzIgdISlWzpxxTEzeWANGopBZGPKVtWrdTFLAAwqfFFUQyuGlYn8
Message-ID: <CAAhSdy2y-hsdNLQf3YVGkC-v7ZdK1NpR6TDnJRoce+qD+7m3Wg@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv: KVM: Fix SBI TIME error generation
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_024417_524291_39862DC8 
X-CRM114-Status: GOOD (  13.44  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhbiBpbnZhbGlkIGZ1bmN0aW9uIElEIG9m
IGFuIFNCSSBleHRlbnNpb24gaXMgdXNlZCB3ZSBzaG91bGQKPiByZXR1cm4gbm90LXN1cHBvcnRl
ZCwgbm90IGludmFsaWQtcGFyYW0uCj4KPiBGaXhlczogNWY4NjJkZjU1ODVjICgiUklTQy1WOiBL
Vk06IEFkZCB2MC4xIHJlcGxhY2VtZW50IFNCSSBleHRlbnNpb25zIGRlZmluZWQgaW4gdjAuMiIp
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gaW5kZXggNzRlM2EzOGM2YTI5Li41ZmJmM2Y5
NGYxZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gQEAgLTIxLDcgKzIxLDcg
QEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF90aW1lX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgdTY0IG5leHRfY3ljbGU7Cj4KPiAg
ICAgICAgIGlmIChjcC0+YTYgIT0gU0JJX0VYVF9USU1FX1NFVF9USU1FUikgewo+IC0gICAgICAg
ICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsgICAg
ICAgICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi40OC4xCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
