Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBDAE7718D
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocTJau1aiztnqBzpCkDz02dDMhE0eNK0NSJ9paee1qc=; b=bTPWi5dgkR4sva
	WNziW8K1X/tPymj1ATS2GQILP80Jh8oJfwG4rwqKEGMaA/AmgVj58ZZE2zAxUmZ+FUjNecOg19I9B
	n00ODdQAqkKOmu06ZI4xdsu4+6poIV9ZZC5ctJ6VatDcEfrnY+1DtRHjCxxruUy4Sq/0QEm9KpKdl
	CHsi3a7cKr0O2P4y5vxTMwxUMSgoZgeRldDIS1840wObersGRBaeuQOj/J9CnkDJcc3kSACdp9+P+
	Cdr0edeUzDsxU6IfxYg+ovKg5Xue+dOSu7eZx11ncHa3uF56UX9HdSPTnDGPBfR3hm/7AKFRVKP80
	FczdNUpvh/c8CKs2OaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBPK-00000001BOp-2Fb9;
	Thu, 19 Dec 2024 07:57:18 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBEr-0000000190U-1TCW
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:46:31 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so18946139f.2
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Dec 2024 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734594388; x=1735199188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzlfxWAFyTOjTnsD6DMp9PLLcJQhroXi6XJ0Ja4jKS8=;
        b=sQcucZ0czTCcXPS5Ie34qGLogNp64GtPtSddGvrGZZWg65rpFze78iaD5bv4YUZ55O
         JdlTgGaro+QpRP9TNW3mh0ahfrleF+s3yxrVT6oZNqhGtKAcXEHgQ7Qg+y0oLGHDdWqz
         gDSIaKf+6o9m+g2z6ugDNaPg6zuvNj0wQBRHQtJfjmjZPM/wh8D0WN5SeQ6hQApspilu
         m47CHLDdeGeyAA5EA12qWbFnE5aO4umRJRylBHxfeGkdYG/Pq5zjl+UPMQkqKq9szu3v
         xZLKhZvYjNYYyqf4TEpXa3bzaAAiTBE2GGq+lDvIxifNvoGAOZTQXbQ7yOZy+QoZOL/G
         ciHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594388; x=1735199188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzlfxWAFyTOjTnsD6DMp9PLLcJQhroXi6XJ0Ja4jKS8=;
        b=DkKusLbEc8210HbcEF7jiZKnkUioxWnieaeLYN3NkEEF1J5Zyf4FjoWGeH2kP25FRf
         9BN2ytKtr7BegUh6CShigK3TNQrbyroK6YT8hfFKURdnHfOkHQQJIJJuTO2I0tPYTTcg
         OAE8v1UT3+jNPHhWK1hiz90iDyOWfuJjk49D5FWU6kbNHYlVTEMsDT68AOTnqrtgDvL2
         ZKtrFvb0u1VZVhE+buwuahX3C6KfYF90ycDiMAt5vDJWc1s2gwlH2paj5sZ2LRpUyl+J
         dFmXJaKqSH1bqL+Ba3Y+sWqltXg46hHeLmSs7DCuR30ZQKBcKRVRZiBDKT0qGqeCMxwz
         ZPMg==
X-Forwarded-Encrypted: i=1; AJvYcCW3f58hdAP48hhIeieQq7FIgtbucqvPpyWAlVb4axLYzJAr5rf3KqQKbO7S44wFxBA9d3fDSvYzweQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoRPOz31E/8HdVgZ2m6FP7bec4RNDpyG9c7r8TcoUZ9ToSxzhN
	M5Fia7c4bWNc2y3WZMHLidmdV97V+YHcxnkFPCBM4UhV2hZdLzB3zY+vMKaJD/cM69VDFp0Degs
	ML4o1a90GMJ5HltaoQQ8kRMrVMdEaMiynM80xEA==
X-Gm-Gg: ASbGncuOeNVb4YGQaMm2wgbbGWIhUiYA9NEbg150Gd6/dEq2boJ8v/9eX3lgrYf4+vr
	mq26IDoG+BiWAZMfOT2SJKg0X08cmgNtRKNVuFev7
X-Google-Smtp-Source: AGHT+IEl2VHIINWWOqX/TIjrPphy37QQEWpY//lPf2cQsAGp5Fr2UzQ2zg1QergkXg+gvTvXBtQ46kjIk7rWXXu2I5s=
X-Received: by 2002:a05:6e02:164e:b0:3a7:8208:b847 with SMTP id
 e9e14a558f8ab-3c014994c32mr17541505ab.22.1734594388418; Wed, 18 Dec 2024
 23:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20240619153913.867263-1-cleger@rivosinc.com>
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 13:16:16 +0530
X-Gm-Features: AbW1kvZvVibTIPOmSKzCzxVje5Rw-BrkbRTFTVX8TQ75LxnNOw1pz_vbOq-3DA4
Message-ID: <CAAhSdy0NkNgZraqnrTGtGYn-aM+tJ8hhGF4n3U+JP+VOF2BJfw@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: add support for Zaamo and Zalrsc extensions
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_234629_398909_16F44137 
X-CRM114-Status: GOOD (  14.45  )
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

SGkgUGFsbWVyLAoKT24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOToxMeKAr1BNIENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSBjb21taXQgZTg3NDEy
ZTYyMWYxICgiaW50ZWdyYXRlIFphYW1vIGFuZCBaYWxyc2MgdGV4dCAoIzEzMDQpIiksCj4gdGhl
IEEgZXh0ZW5zaW9uIGhhcyBiZWVuIGRlc2NyaWJlZCBhcyBhIHNldCBvZiBpbnN0cnVjdGlvbnMg
cHJvdmlkZWQgYnkKPiBaYWFtbyBhbmQgWmFscnNjLiBBZGQgdGhlc2UgdHdvIGV4dGVuc2lvbnMu
Cj4KPiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgWmMgb25lIFsxXS4KPgo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNjE5MTEzNTI5LjY3Njk0MC0x
LWNsZWdlckByaXZvc2luYy5jb20vCj4KPiAtLS0KPgo+IENsw6ltZW50IEzDqWdlciAoNSk6Cj4g
ICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBaYWFtbyBhbmQgWmFscnNjIElTQSBleHRlbnNpb24g
ZGVzY3JpcHRpb24KPiAgIHJpc2N2OiBhZGQgcGFyc2luZyBmb3IgWmFhbW8gYW5kIFphbHJzYyBl
eHRlbnNpb25zCj4gICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFphYW1vIGFuZCBaYWxyc2MgZXh0
ZW5zaW9ucwo+ICAgUklTQy1WOiBLVk06IEFsbG93IFphYW1vL1phbHJzYyBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmFhbW8vWmFscnNjIGV4
dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0Cj4gICAgIHRlc3QKClRoZXNlIHBhdGNoZXMgY29uZmxp
Y3Qgd2l0aCBzb21lIG9mIHRoZSBLVk0gcGF0Y2hlcyB3aGljaApJIGhhdmUgcXVldWVkIGZvciBM
aW51eC02LjE0LgoKSWYgeW91IGNhbiBBQ0sgdGhlc2UgcGF0Y2hlcyB0aGVuIEkgY2FuIHRha2Ug
aXQgdGhyb3VnaCB0aGUKS1ZNIFJJU0MtViB0cmVlLgoKUmVnYXJkcywKQW51cAoKPgo+ICBEb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgOCArKysrKysrKwo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAxOSArKysr
KysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAg
ICAgICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
ICAgICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAg
ICAgICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAg
ICAgICAgICB8ICA5ICsrKysrKysrLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
ICAgICAgICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgICAgICAgICAgICAgfCAgNCArKysrCj4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1y
ZWctbGlzdC5jICAgICAgICB8ICA4ICsrKysrKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgNTUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gLS0KPiAyLjQ1LjIKPgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
