Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE006C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q3afkp/sfD6tl7eXYXcA+peIADqOheNaWxW86OK+sU=; b=FnlURlukpxDGOT
	McSivQ1jtak+YLz5LcykftLIQwXeaY/KpESU3JrFQH4xdwkSbtXpI5znYB3cXx5fWcplXy19dWuPH
	WE+mB7Nx+u071QmQFqsQLlY8THZPZn5S/kj7Q+op+aVK8wAMV0SD10Wwj+bpVLrSH4aw1UnIZ5jGY
	ttHei71k7iYyY3d9EC6Hvm0mgFGA92YwimAd5AXpCdNJwielpUht0jvxlWYCQopaHiCI5vcGa0PGo
	jL/DWmGzH3rGCoy+aruXfUpF1AsG4luzSBnlX2uSKKd+XkWGW1rox9n8jezOdPIjiwpBwUWXZocne
	Z71R3Jgchwbx+Ww31LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Cu-0000000EQQA-1YX6;
	Fri, 14 Mar 2025 14:40:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6Cr-0000000EQPM-00Rz
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:40:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394a823036so20977705e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741963211; x=1742568011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fxgj92qNVf8hUC6pVQUheuB7d74bdJSB97loH4AdJvM=;
        b=NsvwnYqE7tzK/LcelA4a56TwhjakX6uE/fry3j1UX5IFUUQ1fzmR2F5lZXwu2k1tts
         NlMP6/KvRvqcGDsCiqi03CX1Q7MvBHzAZCk7qlZerdqoNjMTnSmLkCt8XDMNiKnLnhR3
         Od7VN0jVQUcYRksFO6OM2ONFqesvvnCWVPj80hZ1kjckXBrt8rUTHs7Ci01ibJCqYD7V
         t+/tgs06gW8Ryja7JhIHeXkER2p04L/RvvOOWpfGufrJof0USqDail8xAss7xQwfyWSY
         JiKb9jSkHrO+XdwY3ESFMZ7cvPpahA4rI6CcdlbnrVG+Tu57ozJa4oYHmcWS8uSzNpdj
         XZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963211; x=1742568011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxgj92qNVf8hUC6pVQUheuB7d74bdJSB97loH4AdJvM=;
        b=KXIw+KcRPyVs/N/0f5X6xpNn4RJ89zq8YTaYS5IJaUjbSu7fZW0iiicUIvRyWDwwkV
         nXMukaIQG36aEwoT8bOtPuRIffLPV0gfazwrQDju6Iqr52fRXbQfVfg5DPplN5vqxBaD
         0P3d64AII+xlRdWVwmXAL+havReJnw5cGUNMGuKZ2D3LdoIe7OhBJTkMX3Ep7sxY7fQ0
         SVC4jOpuNboI0izO6/QFG9vU466tkYtbT7qN0Qbb+vEuny3xvFOyGnLeipDoQA5CKSah
         TEnjhp0qkubzGT2tcwc3bOKm8ofGZE9LOhXM7J4awFSGNI1xpt+zCBnqqJx3TsDuC6pd
         cnnw==
X-Forwarded-Encrypted: i=1; AJvYcCV8+eM5Oo1sJEicxVf9sNo7XtTV4Z2hey2ba6B3hMbTrHi2iXQuauAdyQbbM8sCNYZXDO73CpBNqUA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoXcoSJZRZvmYXhR+vd1dOCuAT7t7vZsxyT4nGmv4f0r4kblAZ
	AM/7bIj7o7inRJPJs3AXtDO3EoEr+BcUn0MjXZIi5JpQXbj9BO3NJ5cHtudVLf1O+JV1OXD+iD1
	gaSU=
X-Gm-Gg: ASbGnct+RyuTq55U8RPktj3lIwpAc6cYgRhTAEcL8MaD08LGjBRylWJgZXNZ0WWLZ2R
	uueSUELrIFFIYO9tYTxCtWQWX3IlPm/i23DpbHxBKFHh04EPzP5cRmOXTPs9BJQOrB6X54vnTs9
	QmXzb+YHTms5AHfJp8ZziT4OkTgtzIgPV47f9CuuJ5MM0lVcftlLP+B+9b8SYeTqNqvNvxb1/dB
	qS0gmWbvJfJaV551QNRvWovC3NKHS9TdcAVDhnaTim0MMJ+7HCZF8EnfIKyQf+9NHbXWfSqshGP
	P67mKdOCGAXTu1UStaUIB9cHxeiduHMv2WUzD771IdG60dZvcNj57NM68tWfnDUjV0wTrqtG2mU
	oZbQSLZ+BCUY4J7XHMbaPxop9
X-Google-Smtp-Source: AGHT+IFa+aTBGHkeFzcMLxBXa2JTRA6YhHMQUjt/9S3iJBqwVboXGugV53IwLhO2jIlrkkQYoi0gig==
X-Received: by 2002:a5d:584d:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-3971d8015d6mr3449285f8f.25.1741963211193;
        Fri, 14 Mar 2025 07:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62ccsm19220165e9.7.2025.03.14.07.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 07:40:10 -0700 (PDT)
Message-ID: <d9a386a5-2ee6-483f-b78b-91e682925700@rivosinc.com>
Date: Fri, 14 Mar 2025 15:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 0/6] riscv: add SBI SSE extension tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314-eb8cf0b719942c912e254ab2@orel>
 <eaf88dbb-39bb-4755-830a-7c801099c790@rivosinc.com>
 <20250314-2452599f59b82e53e99100e7@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250314-2452599f59b82e53e99100e7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_074013_212280_40AEF605 
X-CRM114-Status: GOOD (  19.68  )
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

CgpPbiAxNC8wMy8yMDI1IDE1OjM0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXIg
MTQsIDIwMjUgYXQgMDM6MjM6MzlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxNC8wMy8yMDI1IDE1OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBGcmks
IE1hciAxNCwgMjAyNSBhdCAxMjoxMDoyM1BNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gVGhpcyBzZXJpZXMgYWRkcyB0ZXN0cyBmb3IgU0JJIFNTRSBleHRlbnNpb24gYXMgd2Vs
bCBhcyBuZWVkZWQKPj4+PiBpbmZyYXN0cnVjdHVyZSBmb3IgU1NFIHN1cHBvcnQuIEl0IGFsc28g
YWRkcyB0ZXN0IHNwZWNpZmljIGFzbS1vZmZzZXRzCj4+Pj4gZ2VuZXJhdGlvbiB0byB1c2UgY3Vz
dG9tIE9GRlNFVCBhbmQgREVGSU5FIGZyb20gdGhlIHRlc3QgZGlyZWN0b3J5Lgo+Pj4KPj4+IElz
IHRoZXJlIGFuIG9wZW5zYmkgYnJhbmNoIEkgc2hvdWxkIGJlIHVzaW5nIHRvIHRlc3QgdGhpcz8g
VGhlcmUgYXJlCj4+PiBjdXJyZW50bHkgNTQgZmFpbHVyZXMgcmVwb3J0ZWQgd2l0aCBvcGVuc2Jp
J3MgbWFzdGVyIGJyYW5jaCwgYW5kLCB3aXRoCj4+PiBvcGVuc2JpIHYxLjUuMSwgd2hpY2ggaXMg
dGhlIHZlcnNpb24gcHJvdmlkZWQgYnkgcWVtdSdzIG1hc3RlciBicmFuY2gsCj4+PiBJIGdldCBh
IGNyYXNoIHdoaWNoIGxlYWRzIHRvIGEgcmVjdXJzaXZlIHN0YWNrIHdhbGsuIFRoZSBjcmFzaCBv
Y2N1cnMKPj4+IGluIHdoYXQgSSdtIGd1ZXNzaW5nIGlzIHNiaV9zc2VfaW5qZWN0KCkgYnkgdGhl
IGxhc3Qgc3VjY2Vzc2Z1bCBvdXRwdXQuCj4+Cj4+IFllYWggdGhhdCdzIGR1ZSB0byBhNi9hNyBi
ZWluZyBpbnZlcnRlZCBhdCBpbmplY3Rpb24gdGltZS4KPj4KPj4+Cj4+PiBJIGNhbid0IG1lcmdl
IHRoaXMgd2l0aG91dCBpdCBza2lwcGluZy9rZmFpbGluZyB3aXRoIHFlbXUncyBvcGVuc2JpLAo+
Pj4gb3RoZXJ3aXNlIGl0J2xsIGZhaWwgQ0kuIFdlIGNvdWxkIGNoYW5nZSBDSSB0byBiZSBtb3Jl
IHRvbGVyYW50LCBidXQgSSdkCj4+PiByYXRoZXIgdXNlIGtmYWlsIGluc3RlYWQsIGFuZCBvZiBj
b3Vyc2Ugbm90IGNyYXNoLgo+Pgo+PiBZZXMsIHRoZSBicmFuY2ggZGV2L2NsZWdlci9zc2Ugb24g
Z2l0aHViIGNhbiBiZSB1c2VkOgo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vcml2b3NpbmMvb3Bl
bnNiaS90cmVlL2Rldi9jbGVnZXIvc3NlCj4+Cj4+IEknbSB3YWl0aW5nIGZvciB0aGUgc3BlY2lm
aWNhdGlvbiBlcnJvciBjaGFuZ2VzIHRvIGJlIG1lcmdlZCBiZWZvcmUKPj4gc2VuZGluZyB0aGlz
IG9uZS4KPiAKPiBXaGlsZSB1Z2x5LCBJJ20gbm90IG9wcG9zZWQgdG8gZG9pbmcgYW4gU0JJIGlt
cGxlbWVudGF0aW9uIElEIGFuZAo+IHZlcnNpb24gY2hlY2sgYXQgdGhlIGVudHJ5IG9mIHRoZSBT
U0UgdGVzdHMgYW5kIHRoZW4ganVzdCBTS0lQCj4gd2hlbiB3ZSBkZXRlY3Qgb3BlbnNiaSBhbmQg
bm90IGEgbGF0ZSBlbm91Z2ggdmVyc2lvbiBvZiBpdC4gSWYgd2UKPiBnbyB0aGF0IHJvdXRlLCB0
aGVuIHBsZWFzZSBjcmVhdGUgYSBzZXBhcmF0ZSBwYXRjaCB0aGF0IGFkZHMgYQo+IGNvdXBsZSBm
dW5jdGlvbnMgaW4gbGliL3Jpc2N2L3NiaSBhbGxvd2luZyBhbGwgc2JpIHVuaXQgdGVzdHMgdG8K
PiBlYXNpbHkgY2hlY2sgZm9yIHNwZWNpZmljIFNCSSBpbXBsZW1lbnRhdGlvbnMgYW5kIHZlcnNp
b25zLiAoV2UnbGwKPiBwcm9iYWJseSB3YW50IHRvIHN0ZWFsIHRoZSBrZXJuZWwncyBzYmlfbWtf
dmVyc2lvbiBhbmQgYWRkIGFuIGVudW0KPiBvciBkZWZpbmVzIGZvciB0aGUgU0JJIGltcGxlbWVu
dGF0aW9uIElEcy4pCgpCYXNlZCBvbiB0aGUgZmFjdCB0aGF0IGl0IGFjdHVhbGx5IGNyYXNoZXMg
b24gZWFybGllciBPcGVuU0JJIHZlcnNpb24sIEkKZmVlbCBsaWtlIHdlIGFyZSBub3QgZ29pbmcg
dG8gY3V0IGl0IGlmIHdlIHdhbnQgaXQgdG8gYmUgcmVsaWFibGUgb24gYWxsCk9wZW5TQkkgdmVy
c2lvbnMuIEknbGwgdGFrZSBhIGxvb2sgYXQgd2hhdCB5b3UgcHJvcG9zZS4KClRoYW5rcywKCkNs
w6ltZW50Cgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
