Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEA3C36008
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLCO2+DJy3Ng5FwQwdvwhxtM/LmITVMUIm9PHrxrDAc=; b=PL3y9jzo22ZPH1
	cqlEEwhsJMe3m2GMEl+rtUoUOHzUPYd8S5DhlTufvVdOjUNv3nnzoK3WXXM0blsDW9z5vNTlZkPPM
	WKKwN9INfb1RxOed8ZBSdaYJyA2ZGDpadjX3TzYcNulVAjQ+2TRiQb6sfcEoVa6xT5TfMpnPZgqDC
	vEMW6+A/yCxLDB2AikD0vQzw7xz9m+KcG11NHoxmm+wsqmcXbbAvD01rYKQ6gYyGc2wbJpcpouJqE
	7Tw043O1vNsRtKiOYfcQa0DiY/z5lHLfYyuiykMEylQ8uxT1QJUfGIxUcc0Q6n1btoB8ZBmABi3OL
	E58h0nj5kBdG33358iGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdMq-00000002cNv-1j1f;
	Mon, 24 Mar 2025 08:41:08 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdMn-00000002cMO-485g
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:41:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso6198279a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742805665; x=1743410465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3uw5Z9jtzCHbHI92vRIdMw4q+7D7K0HGUyXcM2dV4I=;
        b=rw0J9scJ/Ej90IOE//lJF18YMcOnkJKSYheFaCU4OLw1T4po6hVHz92MZJZcMELGo3
         Erat/3KJ2Ce6Rv29Qkw8ODeHE/7EdReG3cYXnB3LDbJawNxhmcPkzBtxp324F1fBc2i5
         Exfv2ucbphWevy3hNTxb+vQf1BvIlVamM08EUyPxG5NPANkG7IHGKlfnWDDBlQ5YK7lk
         I74U90bP6SuDTQ5ZfAiNHJ1/B8xD1LYjsybB6l5inhmiTbpTPHDsg4h2P/4IUX0ZCyOR
         ixu4FtHdk5wTee9Dx5I1A2lr3KQAh6pqONyfuprFLe7JZ+QI/GF3LjNf0GvVLsS4Cwdc
         DzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805665; x=1743410465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3uw5Z9jtzCHbHI92vRIdMw4q+7D7K0HGUyXcM2dV4I=;
        b=RL1/ioqqwwJwXEp8s1Vlt41DllRG8EOzeSPp1IrO3JGNHe1pWrNEbuMMSVJDU/SCxh
         TiNHcDRFkiOr6Z5wuiONYmhEIhqRyT44RLIIgkBlYi4YyTXweB/aZcmgXBSbABsDisZV
         yCVLd3R9PEQtvXWYVkHJvRqip3l0M3BqjC+v/kPGUmHiqp77ABPL3+TO/cKfWUURSGz9
         XvAbIPuEdr+fIkbpvkV8/HQhBlTgxx7+1BLNKJtxoY2X6Kl5Ywe1f4pHTNlEEHP/jGXD
         s8alBybXbmahbd1J290y/U5wosSxNyLxs33+fNiXTMVGGpjpFunY8jgd6L/o+SRcJm5E
         HnYg==
X-Forwarded-Encrypted: i=1; AJvYcCUp2HmQuv6pCJOko4x58HOcTUYT6k93poFgIBbNMBMAxW+cQEYcSEqP8KplxCWs3ImkvxR+Y3Cthjg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ3W72NSeBD3/PG5RTb+ZYWQKRXS+lUb5YJfADQrAia+tiX8zJ
	9caBTGKPEi//+JUoXfOM1A/LbIu7o0/GvCX2bMqwKbQ4T0ZcVsgNevf/Ra0MzpbFFuItPRbnehK
	8mB4=
X-Gm-Gg: ASbGncuBFonW41vHU8Cx8W1ciMm0aj0hg3YjYFESJ1XdRoFLL4Ee9MBtseJHmY+EaEr
	O2wScc94hm87MrEEdrghg+sdexXxcYOo+w/0G5HGPlTtysPzdTAjhGz0eVnUaOEFFbCFtD+1JKc
	7s1BPOEbxygh7Iby3aIxbYDQ8X366ztIkqR6Tl0zp117LNIOKS7lbtUPu6bm9ICqsHu5oFv3AKv
	rlyoeObetJxH35+KySnV2QhMpnr0fPzC0ukoy7vWz4QCz4HBPfKhv8CJ9vLHgeDGLdBDJ5XKGDd
	utOy6DnnQ78rJZAydzeADcMv4ZhTXkV1KbBl1IcIED/Sw9pf82DGTonZuxMAu7zW2IEqTDaJzIM
	akqjRD77gX1C9KA==
X-Google-Smtp-Source: AGHT+IH+xgozTyBMkBlyP74TERrNWkyYdKcQs55orpOAP7tn2ARvtV/+JWl6ctnTGkBpb3mEArC3yQ==
X-Received: by 2002:a17:90b:4d:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-3030ff00e7bmr17510813a91.30.1742805664916;
        Mon, 24 Mar 2025 01:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f7e9bbasm7435204a91.39.2025.03.24.01.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:41:04 -0700 (PDT)
Message-ID: <0597da6f-cc28-497f-a49e-3f1c99a4e6e1@rivosinc.com>
Date: Mon, 24 Mar 2025 09:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
 <20250322-cce038c88db88dd119a49846@orel>
 <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
 <20250324-5d1d09fc9e50d2276ba56b6f@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250324-5d1d09fc9e50d2276ba56b6f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_014106_020636_E04BC8A7 
X-CRM114-Status: GOOD (  18.25  )
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

CgpPbiAyNC8wMy8yMDI1IDA5OjM4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MjQsIDIwMjUgYXQgMDk6Mjk6MzNBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyMi8wMy8yMDI1IDEzOjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBNb24s
IE1hciAxNywgMjAyNSBhdCAwNjowNjowOFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gQSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFw
cyB0aGVtIGFzIGNsb3NlIGFzCj4+Pj4gcG9zc2libGUgdG8gZXJybm8gdmFsdWVzLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+
Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgOSArKysrKysrKysK
Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3NiaS5oCj4+Pj4gaW5kZXggYmIwNzdkMGM5MTJmLi5kMTFkMjI3MTdiNDkgMTAwNjQ0Cj4+Pj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKPj4+PiBAQCAtNTM2LDExICs1MzYsMjAgQEAgc3RhdGljIGlubGlu
ZSBpbnQgc2JpX2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKPj4+PiAgCWNhc2UgU0JJX1NV
Q0NFU1M6Cj4+Pj4gIAkJcmV0dXJuIDA7Cj4+Pj4gIAljYXNlIFNCSV9FUlJfREVOSUVEOgo+Pj4+
ICsJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NLRUQ6Cj4+Pj4gIAkJcmV0dXJuIC1FUEVSTTsKPj4+
PiAgCWNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgo+Pj4+ICsJY2FzZSBTQklfRVJSX0lOVkFM
SURfU1RBVEU6Cj4+Pj4gKwljYXNlIFNCSV9FUlJfQkFEX1JBTkdFOgo+Pj4+ICAJCXJldHVybiAt
RUlOVkFMOwo+Pj4+ICAJY2FzZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzoKPj4+PiAgCQlyZXR1
cm4gLUVGQVVMVDsKPj4+PiArCWNhc2UgU0JJX0VSUl9OT19TSE1FTToKPj4+PiArCQlyZXR1cm4g
LUVOT01FTTsKPj4+PiArCWNhc2UgU0JJX0VSUl9USU1FT1VUOgo+Pj4+ICsJCXJldHVybiAtRVRJ
TUU7Cj4+Pj4gKwljYXNlIFNCSV9FUlJfSU86Cj4+Pj4gKwkJcmV0dXJuIC1FSU87Cj4+Pj4gIAlj
YXNlIFNCSV9FUlJfTk9UX1NVUFBPUlRFRDoKPj4+PiAgCWNhc2UgU0JJX0VSUl9GQUlMVVJFOgo+
Pj4+ICAJZGVmYXVsdDoKPj4+PiAtLSAKPj4+PiAyLjQ3LjIKPj4+Pgo+Pj4KPj4+IEknbSBub3Qg
YSBodWdlIGZhbiBzYmlfZXJyX21hcF9saW51eF9lcnJubygpIHNpbmNlIHRoZSBtYXBwaW5ncyBz
ZWVtIGEgYml0Cj4+PiBhcmJpdHJhcnksIGJ1dCBpZiB3ZSdyZSBnb2luZyB0byBkbyBpdCwgdGhl
biB0aGVzZSBsb29rIHByZXR0eSBnb29kIHRvIG1lLgo+Pj4gT25seSBvdGhlciB0aG91Z2h0IEkg
aGFkIHdhcyBFMkJJRyBmb3IgYmFkLXJhbmdlLCBidXQgbmFoLi4uCj4gCj4gQWN0dWFsbHksIEkg
anVzdCByZWNhbGxlZCB0aGF0IHRoZXJlIGlzIGFuIEVSQU5HRSwgd2hpY2ggd291bGQgcHJvYmFi
bHkgYmUKPiBhIGJldHRlciBtYXRjaCBmb3IgYmFkLXJhbmdlIHRoYW4gRUlOVkFMLCBidXQgSSdt
IG5vdCBzdXJlIGl0IG1hdHRlcnMgbXVjaAo+IGFueXdheSBzaW5jZSB0aGlzIGZ1bmN0aW9uIGRv
ZXNuJ3QgcHJvbWlzZSAxLXRvLTEgbWFwcGluZ3MuCgpZZXMsIGJ1dCBFUkFOR0UgZGVzY3JpcHRp
b24gaXMgYWN0dWFsbHkgInJlc3VsdHMgYXJlIHRvbyBsYXJnZSIsIGJ1dCBhdApsZWFzdCBpdCdz
IG5hbWUgaXMgbW9yZSBkZXNjcmlwdGl2ZS4gTGV0J3MgZ28gd2l0aCBpdC4KCj4gCj4gVGhhbmtz
LAo+IGRyZXcKPiAKPj4KPj4gWWVhaCBJIGFsc28gdGhpbmsgc29tZSBtYXBwaW5ncyBhcmUgYSBi
aXQgb2RkIGV2ZW4gdGhvdWdoIEkgc2tpbW1lZAo+PiB0aHJvdWdoIHRoZSB3aG9sZSBlcnJubyBs
aXN0IHRvIGZpbmQgdGhlIGJlc3QgcG9zc2libGUgbWFwcGluZ3MuIEknZCBiZQo+PiBoYXBweSB0
byBmaW5kIHNvbWV0aGluZyBiZXR0ZXIgdGhvdWdoLgo+Pgo+PiBUaGFua3MsCj4+Cj4+IENsw6lt
ZW50Cj4+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gZHJldwo+PgoKCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
