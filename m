Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3DAC83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYYELrS4sVkFMrtEyj/jsOZgPlAQrv1F7j6odfgsCTQ=; b=wo/Zeupc9CckUc
	FugWqxuM36tc57O5BI/Tdf+dG3rKcP5BSleoAtmLf7Aj96IZzrW0vJx0up8BmQuK+xTDNmji2vT5S
	tbKPpfg/vR66ZYXLpc9CBCe8ZFjJO9M7vz2pcYUyschHVRXbUVxp41gFiKCNaOPVhiwveA63jxn8F
	M2GFTXI/hFwBf0xOalI2dqMsXlgZL6yZCtygTEqVI8UCrnbJSRenVe6LjmUdPoGNt5yrgYga3gExH
	Y3mka0ZUkxFpSTrtmwzkxJ4RwMdeCFtIaPwGqB7FEtEVd7d5bieQ558yAmv3YbIDO42bhxBC42IUv
	Ob0nXIqr1miudr/m3U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRQS-0000000F4wG-2iuX;
	Mon, 28 Jul 2025 17:14:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQTS-0000000Ewco-1oID
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753719193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFSyKJdecv/1MRDq0uV/UWoK1UBfsR1Jl9RmuHJI4aM=;
	b=bqnNJhz/BR2uzb+uqQlD4ITheVHt8OO9X17b6XHV6imc2d67NaMxwH0sTzUjkyylHO39Gx
	DNlKaqNkqa6FhtQ/+HrJObQyYlRkWnz68JB5EVoUa3lMWiHSsUPdmlDQ4QUrwJ9JFLXMQZ
	KqOEODRglwA0CWhGgRk6dmDhAGrbSqk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-DEo9t6-dPj-WyWf34ep1LA-1; Mon, 28 Jul 2025 12:13:12 -0400
X-MC-Unique: DEo9t6-dPj-WyWf34ep1LA-1
X-Mimecast-MFC-AGG-ID: DEo9t6-dPj-WyWf34ep1LA_1753719191
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b78aa2a113so603203f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753719191; x=1754323991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFSyKJdecv/1MRDq0uV/UWoK1UBfsR1Jl9RmuHJI4aM=;
        b=TbPsoU0j6cVGS0nlshLBY6AjrCoSpRsmsod9MwhtywibG/G9CUU9yrb7jhfYy5no2w
         b4V7zUq7FaWLALvRfoGGar+5wCfb7/Fqt5MFu9FtXkYvPWXBn8VjSM67A5DMcsYb/baE
         +50cOKm6tPpttXhgcE/pHfVhGIhXeYSGL7BhcrcGbwre0EmzUg1nsa+BQH+MhXcVcbnZ
         MZNPdJniZwtY1YhnmU20e8LxSoMzifwDcfONPTwxYKJG42OornDEDHfwAjEk/1HvpP4V
         z1naVYtL0KzY2LE4r6XFgXnm4hJXyC2B9ji5njn+E1znOr9nqvU+tW4G/rDMJQ9MXlD/
         147w==
X-Forwarded-Encrypted: i=1; AJvYcCVJLxqVAZsIcO9LrAzKSp6tAu0ZrRiNlYHytY3jhyf31ceD0RYGYtq+a8jasvCodebl9y0qqovzyMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyE8d2Dn8TUGOBaH2v3SQDunX9gIMTra6gjBcTlfSGc9O7WPWKt
	dszsaYPzatQQm8wKrrsLeGOZ76P5QeOl9gNFlxp4PYyuHcLR26HHsGiRbRagznjIddc1W/eCOtA
	39RatoMTM9PzWeXEl+faN6a0KgDM1voMsDfuYGQej81VDVcyCVfFm61ZeCIEtZJqxE8dJAomZUS
	opT7ktfJkbZLLzEn8/OzkA2Qp8A74HSNr3RZSxUmAd3Q==
X-Gm-Gg: ASbGncuOQ2/y+s4YgTPT5OVu8j+7I7Xlht7PU1sI5VHGmlxZLZwxoIT7t+dKpskyDXv
	Fgb1YV6W0y10z8mtE635JKAmqhMW3DRXLAeKQleTiQsb9AqlsPEsjFaLNIF0Tn9yiFp5T8xddLP
	MMFWTBJdVMRQ+5dFEaww0Llg==
X-Received: by 2002:a5d:5d86:0:b0:3b7:871b:8cba with SMTP id ffacd0b85a97d-3b7871b8d7fmr3956582f8f.55.1753719190779;
        Mon, 28 Jul 2025 09:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWWWEK4FMuzka8/nfxF96/PztlXrkB6yJIpynbPb+zfrrEU+L+fITa5lHzMJzyOEcmb5yZy3SmKtEj2AkMJio=
X-Received: by 2002:a5d:5d86:0:b0:3b7:871b:8cba with SMTP id
 ffacd0b85a97d-3b7871b8d7fmr3956548f8f.55.1753719190400; Mon, 28 Jul 2025
 09:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com> <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
In-Reply-To: <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Jul 2025 18:12:59 +0200
X-Gm-Features: Ac12FXwUHOVXqDpc5CP8DQR9OWMiwskCL4EwTXkcLoTa8Rg2-Y0UmIDt4HRK2XU
Message-ID: <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2SBCKzFHzyHWU2bYE4dCeKPCw3V_8RaLGaL0sgLJY8Q_1753719191
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_091314_535005_2DADC533 
X-CRM114-Status: GOOD (  10.59  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgNTo1NeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOToyMuKAr1BNIFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDI1LCAyMDI1IGF0IDI6MDbigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PiB3cm90ZToKPiA+ID4gICAgICAgUklTQy1WOiBwZXJmL2t2bTogQWRkIHJlcG9ydGluZyBvZiBp
bnRlcnJ1cHQgZXZlbnRzCj4gPgo+ID4gU29tZXRoaW5nIGhlcmUgYXRlIFF1YW4gWmhvdSdzIFNp
Z25lZC1vZmYtYnkgbGluZSwgd2hpY2ggaXMgcHJlc2VudCBhdAo+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci85NjkzMTMyZGY0ZDBmODU3YjhiZTNhNzU3NTBjMzZiNDAyMTNmY2MwLjE3MjYy
MTE2MzIuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuCj4gPiBidXQgbm90IGluIHlvdXIgYnJhbmNo
Lgo+Cj4gVGhlcmUgd2VyZSBjb3VwbGUgb2YgIi0tLSIgbGluZXMgaW4gcGF0Y2ggZGVzY3JpcHRp
b24gd2hpY2gKPiBjcmVhdGVkIHByb2JsZW1zIGZvciBtZSBzbyBJIHRyaWVkIGZpeGluZyBtYW51
YWxseSBhbmQKPiBhY2NpZGVudGFsbHkgYXRlIFNpZ25lZC1vZmYtYnkuCj4KPiBTb3JyeSBhYm91
dCB0aGF0LgoKTm8gcHJvYmxlbS4gQW5vdGhlciAoYW5kIG1vcmUgaW1wb3J0YW50KSBxdWVzdGlv
biwgZm9yIFNCSSBGV0ZUIEkKZG9uJ3Qgc2VlIGFueSB3YXkgZm9yIHVzZXJzcGFjZSB0byAxKSBw
aWNrIHdoaWNoIGZlYXR1cmVzIGFyZQphdmFpbGFibGUgMikgcmV0cmlldmUgdGhlIHN0YXRlIGFu
ZCBwdXQgaXQgYmFjayBpbnRvIEtWTS4gQW0gSSBtaXNzaW5nCnNvbWV0aGluZz8KClBhb2xvCgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
