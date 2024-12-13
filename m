Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D87AE7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuIvBnVu7hbTNMMppB07qVV7Q43gcc1Q1Kp0wyf8rXs=; b=HgYJBuYC9rjIIf
	ogqJ+/sikO7em8vHl+S2oeHH+vGL/tuWGriYAh9oDNVOnNQdsCOnEBPsJnHuBDs4Q5DLYyl5myTT7
	XVyxkg7hICBH9Q3f7wde0QAy86SgL/6dEHTg0CzQAcerv27OMM5RGMixxieAN9384q8r669thxp3N
	cd2BMdy9eWm7s0lWmeMfUC2b+89t/JYWCwNEkpssTVFbKhD9oNfDwjephjAj6aGuSCS1WKYFvjvwb
	41fCZ3JZo72Nj3uaQTHJxJTerYPCjrrAPG5Cp2PVsAgiqpL5Ugh1B399J1XcdM160Yk0lEgvtlBla
	QkFrlH7BEAghO9a5U/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0uH-000000034KH-3qc9;
	Fri, 13 Dec 2024 08:20:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0uD-000000034IE-0Z1Z
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 08:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734078011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
	b=GXvilEp7JoxI9OBm9dTTOnRQEWeFGOwr5iv8dPr0Fsxf4GcvdPnzlGzKAWJ0WFOjtpJIC5
	p1+J3nVyp9n0QCT8mESe9Y4j3hkxNKJQe1pBtOAFbNBbwkMj8lBgPNgYV7pyHY3hNOXWlU
	xAtCeX/aNwmbtpvRDkHDq/wO/p//hRw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-ooQIJnQRMyK9A49mymijdQ-1; Fri, 13 Dec 2024 03:20:10 -0500
X-MC-Unique: ooQIJnQRMyK9A49mymijdQ-1
X-Mimecast-MFC-AGG-ID: ooQIJnQRMyK9A49mymijdQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385dc37cb3eso823519f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Dec 2024 00:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734078009; x=1734682809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV1wwUvDbgVjftsKa9dU87wk1sPiYCmEM4UeAtv1RqI=;
        b=W0HJhMK6gQA5coOvljZwWjTlMYveqnVE9kcwYwr0G+IeZxgcfWEsU4DS6DShY6Hvj2
         4zMvtfqX317jPklTPp9I6UVwiTVW6zvCaP1y7XUydVB/DgDCDPRAYNmLYhUJMU2ChvTC
         kt1wqqctX9K800jmM7wTHlQs8CmYB/5M4xvVl/e1xhM2TFpflLlkiZCM/m6s2ePPrMTz
         KVXyTp17JSsoLs3bH/Vkgon+tQOcQeiT6xEn0gEAyakmYDqXObQNfbTwKsiNZLnr9Ut6
         4mP226Egy1WGNabB0zL3F35C18fyc6KeHgDHkWsJom/7u8FYii3GEWLccPJ9TI3YuUGz
         kn0w==
X-Forwarded-Encrypted: i=1; AJvYcCU0lgDYlbxIovr2+tnFqdIHnVlnIav5K6RIB9imHMCp2Iim7SXtrF3ywlhg/vJ8SkS8gcsQCLJi/0A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzti3GTO/VV1kTtB5wjbGlEMo9KlmAaBn0Cc/E9OIfCOt0k5RUJ
	tCaklPfwLFONUWCk6yjvu25UXfSnttAe7eHpNcMJPyVznTB97MKr/zV88nHcFkSIzz3JLWIjvu6
	e75ycKuRQb0mKXj+ATxBhaBIZva+HNFpVz5+evcn2N96R1ksSRZYCjbq3V3xJIm8=
X-Gm-Gg: ASbGnct+lSckV/smnBfIiCV6bMjF9CAPOsGTYqY2puPc4bFU/wYmX81Vq02IYu1/z6t
	gsV2GH8OlNveVb4QGNMQKGaWMuCT30U5s+fsP2BUMFfPEQIBH1S5VWq48JXnmmlHqzBOSHzCF91
	ZKNfifAtNhzhgI+gwfyifrnCDDk+xS3FHY+ZP1a1xL7hoh4pqKNgw91M5S+aSLykNaCVZX/yKAu
	qivdgZ04CBh+ZJs+mgKcqSR5kkg13jJWo5yWd7ndzx0gqpAUHsfRiRLvcM=
X-Received: by 2002:a05:6000:1a8e:b0:386:32ea:e70d with SMTP id ffacd0b85a97d-3888e0ba2f4mr910616f8f.50.1734078009100;
        Fri, 13 Dec 2024 00:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrCHiXBGnM5x0F9+IJDtAVhPlkiWHtx4O9ovcSIL7K/Npye3omEspq5dEzagyGc9xjVrwPFg==
X-Received: by 2002:a05:6000:1a8e:b0:386:32ea:e70d with SMTP id ffacd0b85a97d-3888e0ba2f4mr910591f8f.50.1734078008749;
        Fri, 13 Dec 2024 00:20:08 -0800 (PST)
Received: from [192.168.10.3] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4362559ed8dsm42786805e9.23.2024.12.13.00.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:20:08 -0800 (PST)
Message-ID: <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
Date: Fri, 13 Dec 2024 09:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
To: Arnd Bergmann <arnd@arndb.de>, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: kvm@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T3KnWpe7wllJIq9a5IIc-gvWV08BbWalCcQZhRgQJ90_1734078009
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_002013_237998_33A702DB 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMTMvMjQgMDk6MDMsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24gRnJpLCBEZWMgMTMs
IDIwMjQsIGF0IDA0OjUxLCBBLiBXaWxjb3ggd3JvdGU6Cj4+IE9uIERlYyAxMiwgMjAyNCwgYXQg
Njo1NeKAr0FNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+Cj4+PiBJIHN1Ym1pdHRlZCBhIHBh
dGNoIHRvIHJlbW92ZSBLVk0gc3VwcG9ydCBmb3IgeDg2LTMyIGhvc3RzIGVhcmxpZXIKPj4+IHRo
aXMgbW9udGgsIGJ1dCB0aGVyZSB3ZXJlIHN0aWxsIGNvbmNlcm5zIHRoYXQgdGhpcyBtaWdodCBi
ZSB1c2VmdWwgZm9yCj4+PiB0ZXN0aW5nIDMyLWJpdCBob3N0IGluIGdlbmVyYWwsIGFzIHRoYXQg
cmVtYWlucyBzdXBwb3J0ZWQgb24gdGhyZWUgb3RoZXIKPj4+IGFyY2hpdGVjdHVyZXMuIEkgaGF2
ZSBnb25lIHRocm91Z2ggdGhvc2UgdGhyZWUgbm93IGFuZCBwcmVwYXJlZCBzaW1pbGFyCj4+PiBw
YXRjaGVzLCBhcyBhbGwgb2YgdGhlbSBzZWVtIHRvIGJlIGVxdWFsbHkgb2Jzb2xldGUuCj4+Pgo+
Pj4gU3VwcG9ydCBmb3IgMzItYml0IEtWTSBob3N0IG9uIEFybSBoYXJkd2FyZSB3YXMgZHJvcHBl
ZCBiYWNrIGluIDIwMjAKPj4+IGJlY2F1c2Ugb2YgbGFjayBvZiB1c2VycywgZGVzcGl0ZSBDb3J0
ZXgtQTcvQTE1L0ExNyBiYXNlZCBTb0NzIGJlaW5nCj4+PiBtdWNoIG1vcmUgd2lkZWx5IGRlcGxv
eWVkIHRoYW4gdGhlIG90aGVyIHZpcnR1YWxpemF0aW9uIGNhcGFibGUgMzItYml0Cj4+PiBDUFVz
IChJbnRlbCBDb3JlIER1by9TaWx2ZXJ0aG9ybmUsIFBvd2VyUEMgZTMwMC9lNTAwL2U2MDAsIE1J
UFMgUDU2MDApCj4+PiBjb21iaW5lZC4KPj4KPj4KPj4gSSBkbyB1c2UgMzItYml0IEtWTSBvbiBh
IENvcmUgRHVvIOKAnFlvbmFo4oCdIGFuZCBhIFBvd2VyIE1hYyBHNCAoTUREKSwgZm9yCj4+IHB1
cnBvc2VzIG9mIGJpc2VjdGluZyBrZXJuZWwgaXNzdWVzIHdpdGhvdXQgaGF2aW5nIHRvIHJlYm9v
dCB0aGUgaG9zdAo+PiBtYWNoaW5lICh3aGVuIGl0IGNhbiBiZSBkdXBsaWNhdGVkIGluIGEgS1ZN
IGVudmlyb25tZW50KS4KPj4KPj4gSSBzdXBwb3NlIGl0IHdvdWxkIHN0aWxsIGJlIHBvc3NpYmxl
IHRvIHJ1biB0aGUgaG9zdHMgb24gNi4xMiBMVFMgZm9yCj4+IHNvbWUgdGltZSB3aXRoIG5ld2Vy
IGd1ZXN0cywgYnV0IGl0IHdvdWxkIGJlIHVuZm9ydHVuYXRlLgo+IAo+IFdvdWxkIGl0IGJlIGFu
IG9wdGlvbiBmb3IgeW91IHRvIGp1c3QgdGVzdCB0aG9zZSBrZXJuZWxzIG9uIDY0LWJpdAo+IG1h
Y2hpbmVzPyBJIGFzc3VtZSB5b3UgcHJlZmVyIHRvIGRvIG5hdGl2ZSBidWlsZHMgb24gMzItYml0
IGhhcmR3YXJlCj4gYmVjYXVzZSB0aGF0IGZpdHMgeW91ciB3b3JrZmxvdywgYnV0IG9uY2UgeW91
IGdldCBpbnRvIGRlYnVnZ2luZwo+IGluIGEgdmlydHVhbCBtYWNoaW5lLCB0aGUgcmVzdWx0cyBz
aG91bGQgZ2VuZXJhbGx5IGJlIHRoZSBzYW1lIHdoZW4KPiBidWlsZGluZyBhbmQgcnVubmluZyBv
biBhIDY0LWJpdCBob3N0IGZvciBib3RoIHg4Ni0zMiBhbmQgcHBjMzItY2xhc3NpYywKPiByaWdo
dD8KCkNlcnRhaW5seSBmb3IgeDg2LTMyOyBwcGMzMiBzaG91bGQgYmUgYWJsZSB0byB1c2UgUFIt
c3RhdGUgKGFrYSB0cmFwIGFuZCAKZW11bGF0ZSkgS1ZNIG9uIGEgNjQtYml0IGhvc3QgYnV0IGl0
J3MgYSBiaXQgbW9yZSBwaWNreS4gIEFub3RoZXIgCnBvc3NpYmlsaXR5IGZvciBwcGMzMiBpcyBq
dXN0IGVtdWxhdGlvbiB3aXRoIFFFTVUuCgpQYW9sbwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
