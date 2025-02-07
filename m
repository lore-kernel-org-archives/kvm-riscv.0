Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAD8C02192
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsGPPW+4oOZXeu1CBPy0ITyEsYGYLm/0gceqoOXC1BE=; b=sSLfe6KsXWO2Yv
	HQweoOdOWKmnZHRXim/XdG0IQyX4EfVqAxOlQMqyVG+t0ZTku4waKOih9u18tGBmR+ZKY20oa9Q9d
	M0caE/jtqz5C/DPKY0qwDTkLIPc1lruAI8CNMEEZR1yDEni4BnojWKbFPteTOG/jb+d6e0cAPL+o2
	vITUkafW/qvxCOT13JHHpmHLzaKHXrdF+pCHeGcxnbZaxf9YSyfHTODfUHO2y5XDjl/zrilwg/TDK
	OryGy34q/x1fRk+4KAZSGcCGbGEBHvXxWPKA1Yzjo4jjTVaVCO3CxfWkRYsWM4NXOXRkeZ40ScKSJ
	ytJET76PS+s7t+TLcmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJQv-00000008l85-4B0q;
	Fri, 07 Feb 2025 08:09:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJPH-00000008kVo-1vYk
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 08:08:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436a03197b2so11608855e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738915689; x=1739520489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7+57nAAv8QP4u/IKjzXqebMrcWsPnCBFtc7wCFJPUQ=;
        b=wgiUCXjk66r196pzS8nn4L9mUhDNRHTVu/3iYrhILe2Ef+UUwnqllIOVuNCcF9IL0f
         09Xwqfn5Ezsj2671z63amrh7G+05WC8vUI1bP0xZKbTm3wP+To1SD40YEhdVLoYdCIWW
         xz7TZIZaLby+hwnCrpS1WTbRxsod/KjV8TdTZelzZPIsJqfppA2A6hHc8uSNtiabi07j
         HitrKO4mHnaK7oUFuXdgkPb3sj6QI6grVgcZUh6wCiP0ZQ71brHLkNL2zS3RAr4Lt7OK
         fBLNy7Mbk+E2SvRO6tyRcsIrmngFaCW2//MkqGr1ra1MOJeDf2Bh8Fg5EI6558fWsf7z
         K2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915689; x=1739520489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7+57nAAv8QP4u/IKjzXqebMrcWsPnCBFtc7wCFJPUQ=;
        b=T/CNVgmSXOQEDq0c6jh/oIJcCStDTWbtzyunW9LYkS63tGd8Az42B0oFxna89tY+yz
         w3NyVVTEZpyLwHIs4vEV5dqrgLsOlnvguhzPNPM6UVR2x0iVqX9xHjG8jehqU6vxhKeK
         waSyFcqK7jLiU1hySaztCI64Fq3EyILwHPMuwQyFrBrL8Del9dd35qj2a5Ewi8IEXqiX
         +bj0yKvz/lko+K7SDT59W7MCDoWZQy/lnR7aqj45Y/g3aWK/LH1P2dTk2ovdEVCD9v/r
         9Uz5QqwhuY0VM9ZxGsNsLKzueqyDNjS/fQyLfa/KL1Ma19bo97VfOamYpFLu5fM48Wks
         9RDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV0Ww9YSryuJdY3X/fkjGcVossp7T+IlcNLTWXraKqfl+5NNCG8mOJ4jolI4KE69qgyY8ccWglIKE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+ih30zMA501JLeUyO3l+vxA37oYhb88nPsEeizOt1LYtBSElw
	Van0KARuDZDQWW4Pa/vS2aTIz/3dYKcLr+YdxgO9Zq7MACWRSHRouHf86cwOo98=
X-Gm-Gg: ASbGncvYTAomwIlDYvKrgkhozyyCOWmi7b6Xy0i0sOH0DVSoVdvDLx/z0I5J5dg6Ntn
	TWZUS0dAzOIyE3xwlFs8QdWBrNEH5yq0USINz8fsysBaWyQ0UCw+DTqksy1QDhEOS63IitMV4Xb
	u8eOTLVF8pOIwSHzhi3dnaHO3ipHRo6iQMzxTfQPv/Y0MlFGGzIAkxdDKjBU6yTKZU8ph0fYNU5
	Un5YWZB9DyoJnzf3pEdZXpHQmFUTZ4ef4x3vFA3ZQ0NTOdhkiufr8wMlldahBGBI0lmwdg+l3o8
	sojUYvJ9bOt2B+9mEnAhuGWA1jfmyc9X06K1yRHebt/qc6RYk8XAqaqnHGzx
X-Google-Smtp-Source: AGHT+IEpCAnzMJ9gzxKx250V5bllvFofCg+NZdnX2FF6QiB0L9kNIhtil4j6rsAH/g8Ai7a/4f4w3g==
X-Received: by 2002:a05:600c:6c52:b0:434:f335:83b with SMTP id 5b1f17b1804b1-43924a27b10mr19870375e9.5.1738915689136;
        Fri, 07 Feb 2025 00:08:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm45229805e9.13.2025.02.07.00.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:08:08 -0800 (PST)
Message-ID: <d5138234-b0c3-4f78-af9e-33e0d5039ea3@rivosinc.com>
Date: Fri, 7 Feb 2025 09:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
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
 <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_000811_496839_628E2C60 
X-CRM114-Status: GOOD (  15.72  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBTc2NjZmcgKOKAmFNz
4oCZIGZvciBQcml2aWxlZ2VkIGFyY2hpdGVjdHVyZSBhbmQgU3VwZXJ2aXNvci1sZXZlbAo+IGV4
dGVuc2lvbiwg4oCYY2NmZ+KAmSBmb3IgQ291bnRlciBDb25maWd1cmF0aW9uKSBwcm92aWRlcyBh
Y2Nlc3MgdG8KPiBkZWxlZ2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29yLWxldmVsIHN0
YXRlLgoKSGkgQXRpc2gsCgpUaGUgc3BlYyBzZWVtcyB0byBwcmltYXJseSB1c2UgU21jZGVsZWcg
cmF0aGVyIHRoYW4gU3NjY2ZnLiBUaGlzIGNvbW1pdHMKYWRkcyBib3RoIGJ1dCBvbmx5IG1lbnRp
b24gU3NjY2ZnIGluIHRoZSBjb21taXQgdGl0bGUvZGVzY3JpcHRpb24uIE1heWJlCml0IGNvdWxk
IGJlIG5pY2UgdG8gbWVudGlvbiBib3RoIGFzIHdlbGwuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAK
PiBUaGlzIHBhdGNoIGp1c3QgZW5hYmxlcyB0aGUgZGVmaW5pdGlvbnMgYW5kIGVuYWJsZSBwYXJz
aW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAyICsrCj4gIGFyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggYjRlZGRjYjU3ODQy
Li5mYTVlMDFiY2I5OTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTEwMyw2ICsx
MDMsOCBAQAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQJCTk0Cj4gICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9TTUNTUklORAkJOTUKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ05U
UlBNRiAgICAgICAgIDk2Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NDRkcgICAgICAgICAg
ICA5Nwo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01DREVMRUcgICAgICAgICAgOTgKPiAgCj4g
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3Cj4gIAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKPiBpbmRleCA4ZjIyNWM5YzMwNTUuLjNjYjIwOGQ0OTEzZSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiBAQCAtMzkwLDEyICszOTAsMTQgQEAgY29uc3Qgc3RydWN0IHJpc2N2
X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJU0NWX0lTQV9FWFRfQlVO
RExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMpLAo+ICAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoenZrdCwgUklTQ1ZfSVNBX0VYVF9aVktUKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNt
Y2RlbGVnLCBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHNtY250cnBtZiwgUklTQ1ZfSVNBX0VYVF9TTUNOVFJQTUYpLAo+ICAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc21jc3JpbmQsIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQpLAo+ICAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0pLAo+ICAJX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKHNtbnBtLCBSSVNDVl9JU0FfRVhUX1NNTlBNLCByaXNjdl94bGludXhlbnZjZmdf
ZXh0cyksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRf
U01TVEFURUVOKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhU
X1NTQUlBKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9T
U0NDRkcpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRf
U1NDT0ZQTUYpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9F
WFRfU1NDU1JJTkQpLAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNzbnBtLCBSSVNDVl9J
U0FfRVhUX1NTTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCj4gCgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
