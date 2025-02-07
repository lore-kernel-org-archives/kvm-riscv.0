Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44164C02192
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sO0P3Hf1U7MKp3FPAoegm/hW/jD7itV1nzT5OLkXa4=; b=J5IG/4lJ9s20hY
	E7i90mst1tjVUn9myhx/9GGdWMxlzzGOWcd7OKvodUh6TAdfFx5y+A82LeocY5z6AtIkbp4YGOmBb
	wb5KGVIPmgc1ze+dMKRRiNh+U4jxWGKTlWhjUysJGVZjtoex7yda8epx0TWW09SPNyIBOhrfaFsLu
	79eUaLx8ZkpvwT+Am+CJ76iJr/O5RMNchQIRM72MNaALZSzoPK2/m6sZwQxyR2/OlOoRxmQHH/zeu
	ugVC54BOOOiY6/IX/KUzSv++x9Rr9yirOrI5JWgLaSpZtflFdAkHTTC6Pi7sZWWGglOywP2dwHi08
	GFVKa/O3ZvA0GGRdSUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKar-000000090Yb-46kJ;
	Fri, 07 Feb 2025 09:24:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKY7-00000009017-3lik
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 09:21:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436a39e4891so12244865e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738920082; x=1739524882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=O1txkBHNSd1QK67hQfE3AgzdRZIQw2VwGdDYknbqzz6fQ/6GblfNDH/3aemfBR4SFb
         GbLjp0MmnUKmL1ZGp/ItBFXQyyXaepBUHBTRTJS78Rg14shtvjnPR4MAvyj6c9zW4cJT
         8J6o/4UVDJa/49+wqZEghmyy6N571JVU9Wa5uXwbw3aPlO33c4MT82IA7aSNWU2rsQCi
         z+zuc+0st2ymujGtF06+m48XNuL4p1qE+ZvVrykaebVEspP94jFCq8qkoH0I9UVRjFqZ
         TLaXI450tEaz0zEKbp7tPP5fF/SO1I04A4jCgZsgVB810TXmQHuQK4l+06U2hYaBBcC2
         h/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920082; x=1739524882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tiH9b+H/9t/xpf0NWHkN82z4SsEthrDvr6Ide4MKv0=;
        b=Mue50lSYD8Xd9gMfQtLXhVWzA3MpcTkyF6z1tbXWimcJpS3lD72mv08lbR0qZmWY8p
         uS9RcfQdKmioowu4Ed8eGP9wrJNWoNSB4XoNrWjIxQ194YOyhSHQb0kx4c5uN4W1PfHD
         lbUJrwkU/fjBtWOR2gXY4T1u3qVBG8+6QpleHvXXcP1B3jHpmz/voDYuzopDwaDejKTG
         EFhSP7IWe6jPnAZsWWctW/uB+x1VFY7HrZKtaeGUyBpQbZhUYGOORc1ocx41FC5MGx+z
         3j0EynZbSAY0sz7CYldHH1YG5xJvd+uVTcdxE/5v8nB71uqDvLywqoi+9Eau7woA66Cm
         xKZg==
X-Forwarded-Encrypted: i=1; AJvYcCUtabqEjdI7tboDtENVy/WvTxvd873WN29AGEuVnNZudJcsoeF/Y/61Us2CMzAlSkE1oxaXBsa01LA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcwtCJk8jrBN/NlpJ38/Etxlk4GGNj401GE3rpFpGzyLO3Plmk
	5WZcsHnthtcQklT7OK8RVEpV+ixg6ZSbdX3d5PrZFuMvUFe5l4pA4IiAKD8NmKg=
X-Gm-Gg: ASbGncslD4Y2iU4l2j/G5aO7QMyjicCxc/1DOZAN5XmRZI/HiMVC7zXUWIibpTr0l7K
	57UTQGf3zgSsQjQHSArOGlPn6BuWWceX7NJaTitzUMfdbkw/5zVqx0EBtqmcD8dxQKgfBoU+OBl
	Gmc66Oot3rDbloKFS84y+MvF+Qu7C7c/DQrK00sC0wmJ9WpLcxo/putoMkFAsWX7fmASPRd4bB0
	gDSGBgab0hIYFewntdrTVmIsTAWpaivw5zvvp7JaewjEDPITixV7UZkA78WB7O1EKmIXvCbhK8X
	Zxqx6697sIVQa4KyMbZBZXcBqd4YHe5eAvCkmGyMM70IARkOf6IhdWffrM9O
X-Google-Smtp-Source: AGHT+IECWFH7U0mArd280iuB70Vnw8HZQHKBAtWHAu5Pk2zNKD95w0WIBx5nMCf9e60ecld/9uOCGw==
X-Received: by 2002:a05:600c:3c9b:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-439249c385cmr21219595e9.29.1738920082212;
        Fri, 07 Feb 2025 01:21:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439069290c7sm87180725e9.0.2025.02.07.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:21:21 -0800 (PST)
Message-ID: <7aace8a9-0e62-4156-9c50-f7b399c4eba2@rivosinc.com>
Date: Fri, 7 Feb 2025 10:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/21] RISC-V: Add Smcntrpmf extension parsing
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-6-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012123_939930_2F9EBC8B 
X-CRM114-Status: GOOD (  14.70  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBTbWNudHJwbWYgZXh0
ZW5zaW9uIGFsbG93cyBNLW1vZGUgdG8gZW5hYmxlIHByaXZpbGVnZSBtb2RlIGZpbHRlcmluZwo+
IGZvciBjeWNsZS9pbnN0cmV0IGNvdW50ZXJzLiBIb3dldmVyLCB0aGUgY3ljbGVjZmcvaW5zdHJl
dGNmZyBDU1JzIGFyZQo+IG9ubHkgYXZhaWxhYmxlIG9ubHkgaW4gU3NjY2ZnIG9ubHkgU21jbnRy
cG1mIGlzIHByZXNlbnQuCj4gCj4gVGhhdCdzIHdoeSwga2VybmVsIG5lZWRzIHRvIGRldGVjdCBw
cmVzZW5jZSBvZiBTbWNudHJwbWYgZXh0ZW5zaW9uIGFuZAo+IGVuYWJsZSBwcml2aWxlZ2UgbW9k
ZSBmaWx0ZXJpbmcgZm9yIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4gaW5kZXggM2Q2ZTcwNmZjNWIyLi5iNGVkZGNiNTc4NDIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTEwMiw2ICsxMDIsNyBAQAo+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU1ZBRFUJCTkzCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJOTQK
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5ECQk5NQo+ICsjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfU01DTlRSUE1GICAgICAgICAgOTYKPiAgCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9Y
TElOVVhFTlZDRkcJMTI3Cj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCBjNmRhODFh
YTQ4YWEuLjhmMjI1YzljMzA1NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMzkw
LDYgKzM5MCw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4
dFtdID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtzZywgcmlzY3ZfenZrc2dfYnVu
ZGxlZF9leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRf
WlZLVCksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9TTUFJ
QSksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWNudHJwbWYsIFJJU0NWX0lTQV9FWFRfU01D
TlRSUE1GKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBSSVNDVl9JU0FfRVhU
X1NNQ1NSSU5EKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9JU0FfRVhU
X1NNTVBNKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzbW5wbSwgUklTQ1ZfSVNBX0VY
VF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAo+IAoKTG9va3MgZ29vZCB0byBtZS4K
ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpUaGFu
a3MsCgpDbMOpbWVudAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
