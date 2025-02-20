Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62898C021B1
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e31I7Us9G66qHBU6GvKzV+1zldsMBelJ9DuucYv8N64=; b=EOZUs93D67Vyy/
	8qCY4m7vqjLasY+GT7YD+9wjdMzg9InCHETqIrQXSM82zlt/7uTZCnK/grnkxT6MDH/TgLHxUsAdC
	7+u/EJw2wWoIjuKF8ep6nhd1DqqoiTQSxsTEXXHSmUxaEw48QrP1OyPilEEwopWvJfZYm9iMFG0og
	FI6CIvgG0UNOrHyzVdTdl4BgeY9qOM3XRm4cN6UL4y7kc5/Ecg904eOyExvKU2gOaY8r4rvW2ye8S
	2PwTLWHtW86CMgIEHtrT57PLBH2i8Z35AVE25VNj6+Bu6kAaMTDjo+LXbgBgTfCbt8JJp25e/2EVj
	dkb/4o7QhiBWfTLITIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Xb-00000000kkI-0PCp;
	Thu, 20 Feb 2025 12:20:31 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5VC-00000000k7i-0zFt
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 12:18:03 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d2a869d016so2205645ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Feb 2025 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1740053881; x=1740658681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmI+w9rW7xuxQgzQY4zgyZiBf+VpYD43wlkF4w4/Fxk=;
        b=VGC2/LpvQsDKyOiD3BhEkj1u0kjl4lEtjRX7Uxs5scyoN5cLrkOyjRPrKzvIi2FfLZ
         Dpcrwz1uCb/HjnuFYPYwJ7/6hJCjb9jJQvnu1xJ3IJ9G9akYJJ83+Dh39jc0ZTiT61+j
         zkPynYJwhU0KS1TVSxYCHlUyERrtMSliS5F7QuSAqr+8b9FgggX9i0zKwadcLhsDoBVl
         x12tltNJDxzdstiRyuGTf7c+viX0a5YnlzOdM46/OWO7oBEA6oE3fblSpBKTslJ4faaI
         oi590kAGPKjgYwf6JBqB0wNlroxOUQv/F92QcEa8xbPJAuAmDZrcrs0aGbqm96+z3fbj
         k27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740053881; x=1740658681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmI+w9rW7xuxQgzQY4zgyZiBf+VpYD43wlkF4w4/Fxk=;
        b=qLRliCL9n4gQQWLTRgNveeD/lUrtc0Ai3IRIhwAFzHITum5xyR/NNpWJiRDJ6BeQzm
         ltk/GN/kUW+sVVxLONaHToB+sS0neEEG3lr8P3i9gl2D1JFtTn56slHP1uebTOz55+VA
         H1mAQplWtg+Uy4C3Hk+iuAEswLRIf6TAzYo7hNY6ArUEtQSES0DN41CRIq1L9QBwhFWG
         SVsNu6u4yaCrl9A3rkYexLoXY6YLOQTExMDlREK4GiWk89HougvYaI22mXW0F1oyJ8+O
         0DvEhmVkwJMt6dkz+1KZbTkrY5FI1tenQgq+h6pQ/8iJm/2UFNeEPQbCZS7Knsf0iNWY
         Vmig==
X-Forwarded-Encrypted: i=1; AJvYcCV8B2qhS+npCDTrLWtUOBCjFpaVD/P2JPSaQ/HIe+Y5K/nxhs1s/fzoLZjh8tvxdOe7O/hBtkGO+ZA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyga0bcVAw5djBQfYB/+kRFYVySYVpP0HjTGas5RN9Dk58f6R6R
	sv10D3/yBCQWBNouO+GRWGknDKzQPoHz5SUqGHu5oT9ihrJ9es/hVOrxuGJCXatcE+3pAbBfh8I
	KBHFMeI7ePMkRJuBBFTXE/Evc/r2WOfVudIcF+A==
X-Gm-Gg: ASbGncvSjkzl2JthnYfAQut/97EtIiqkT47DavbjK+bm986M3jQfT7S/JlQhOQj6cUN
	QO9q5C+rjyRjase5mgDtS1WOpe1pPF8QAwzzVf141AvYtZGdeF9Migt4rSFD4QsVEGR+1W6UzWA
	==
X-Google-Smtp-Source: AGHT+IHL3+9MtLF5+UaRybyEp8BV4Gc3bjSjy3kw4hdoypBWleJFfSGz7eyOLjRCOfAS7PzLJ2idDqWgGFTRfAm5dPo=
X-Received: by 2002:a05:6e02:152d:b0:3d1:9236:ca52 with SMTP id
 e9e14a558f8ab-3d2b5131279mr59896385ab.0.1740053880695; Thu, 20 Feb 2025
 04:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Feb 2025 17:47:49 +0530
X-Gm-Features: AWEUYZmV63eOiG44RnPBMnqx1Uo6sIZHLWWs9x29seXyEVn1h53Dh8XbVUUsj0U
Message-ID: <CAAhSdy0cqoN5MehwDtQEtK7EYSTXPekwYEJWgPvAK+Y4uk=40Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: KVM: Fix a few SBI issues
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_041802_650844_971D6EFF 
X-CRM114-Status: UNSURE (   8.17  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRml4IGlzc3VlcyBmb3VuZCB3aXRoIGt2bS11bml0
LXRlc3RzWzFdLCB3aGljaCBpcyBjdXJyZW50bHkgZm9jdXNlZAo+IG9uIFNCSS4KPgo+IFsxXSBo
dHRwczovL2dpdGxhYi5jb20vam9uZXMtZHJldy9rdm0tdW5pdC10ZXN0cy8tL2NvbW1pdHMvcmlz
Y3Yvc2JpCj4KPiBBbmRyZXcgSm9uZXMgKDUpOgo+ICAgcmlzY3Y6IEtWTTogRml4IGhhcnQgc3Vz
cGVuZCBzdGF0dXMgY2hlY2sKPiAgIHJpc2N2OiBLVk06IEZpeCBoYXJ0IHN1c3BlbmRfdHlwZSB1
c2UKPiAgIHJpc2N2OiBLVk06IEZpeCBTQkkgSVBJIGVycm9yIGdlbmVyYXRpb24KPiAgIHJpc2N2
OiBLVk06IEZpeCBTQkkgVElNRSBlcnJvciBnZW5lcmF0aW9uCj4gICByaXNjdjogS1ZNOiBGaXgg
U0JJIHNsZWVwX3R5cGUgdXNlCgpRdWV1ZWQgdGhlc2UgZml4ZXMgZm9yIExpbnV4LTYuMTQtcmNY
LgoKUmVnYXJkcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyAgICAg
fCAxMSArKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMgfCAx
NSArKysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgIHwg
IDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi40OC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
