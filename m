Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD173C02192
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jj7OVWVJUDhjeUSavSWXnRwiesFvuatiw8WmNbQFGbs=; b=3Jesxm9qOB6uOI
	EVic/UXBh+fbBmwgqxcA8yqMtLRGyq1OA4h4KGvHwUPk8Titzsm3ovS438lEuH3KY5enZKn+K+1oJ
	JPGWRe96H9mJhxYOs7isKRqQopveKuSKV9rD4iScld4lvUieAiGpqjxD0wk/acP61PJztZI9ilt5h
	+DacecVcWGj6Va1Ie8QUZkTyk9a+zNZQtxAMwN4hR6ltQxMh7EI0jKibxK8NSF6puIcXbBd8Do7Zr
	7BPIcjWi6/tY7OYYczAEZxGLt5rH/G9iYLPMtorVO//fx3VSIpLpeHys+orTc/k6v8ryRTqLHJyzh
	0zrzaFA60Iq6jGl7M6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJWI-00000008mRw-2U9N;
	Fri, 07 Feb 2025 08:15:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJUu-00000008m8z-037u
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 08:14:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-438a39e659cso11390495e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 00:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738916038; x=1739520838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=guaslo/auxQyaNOWSGQtg9fVtVAy6kFjVvZdk/XyEjCmy2FK6RUnKZKiMOHU5H1y49
         I4GWmlMTLKeNkHJd0iqPXa5QF247jH8AmtJmXEQPZ9aLIVMWZUDuijF1UwXr2mv0ggtO
         SFYEapCHSsBxMywHvPVg2EMchVz6xcpre0B0WDFYoQ4dIM2Br7VkLlNmVDT1V2Dw+vYc
         23UjPPvzet404WwZC277/HH8xV0R72tZm4JnUnQbuVCbnlw5RS+nPu5488NQ8qEDi8Jb
         cLl/6BQCZ9DyxgshpD12UUeOQBRzYkknd4mASbI3Bqnt4Ypxsj02DpMTAS51dJG4GpHD
         iTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916038; x=1739520838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffr0OMCgv5rw2MLpHSX7E1qg3OY60t4awxWCHQtHUac=;
        b=YPuE+rPs8iLyRUbCbnTwoU+uHRakGTw1tToa2XVrNDf/E7YHXuF3YOtKSkgG43eFEI
         uLKcH+8vtFOX0ndzebSEbUG52F5iGDF35kcuOOWv3ggAYGL1PYLCT8aTkR8kwzLJeAjL
         Q4QiXG44QNv6KkJUV/6GZlShwHPXAy4/aK4Lme1wDMIU+OE8XKQiBjWBxOjx+/+4uMqL
         AGrPTk0M75RBj2g0w/vZzQP5LRHAAHJy/7GI/EaFNomh/z3PgGqiRKNtPAzuSV395C8K
         qDpnwlaUSFvETdYlhw40y8sjN0vpsUV4FZ8rKlV9bxgnXMok1o4I5LyMBN+x3VE/s8za
         cNOg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFxADd3cwCCYGi6UIqCaNofSHVHf0ObGrARdvWHyKvEZevHlWqkP7gxkVO8Ot6TmXs/9oXOKmBc8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuyYNTAyJO2HNvIyTOu8zBnQAClPN0rkrYeawMGa+SwaP9y6II
	zbMIKCjYYue08FTS0v0kM6wut4enfiJgI99N1IYgmi3Weys7YLoKV8Bgqen2JUk=
X-Gm-Gg: ASbGncsh/2K8MYbo28m2c4xpnzm1h2V6ktfbsvwxIpeG2K+voxDb8Yq3KquTXLtEB9D
	RyeoPUeb/GSegYEYf2i3jnL/7BLK6ACJG9d6/gfJ6shjZ3zRAEYMUv3pX8ee7KVEXtaJO4zVo1L
	KxAgRq0dp3CG3uu7BJEs3XJFzBR27yt2y/PRYZrDBrTxcSkbNTmDuFS/UQj4awnCHoiYW75u0bf
	tMqkUosKR9p9EilpIVUypK42X0L6fux/mMrE8dHW1rua/fmQXtdS5ZQoZxNhPumLFGqZgDAzqEw
	c90v2v7OUI+4o5KU7xuovJOf1Fxyyk75PCbCIER/DpUkM/+OxKecu5GMqM42
X-Google-Smtp-Source: AGHT+IEGr/YRTYNXaAzVLspq4nx30yqY6bs6EtU6OBmGn64/zPMRjPnpKtSGL4mxDnpbYdH0c6ehyw==
X-Received: by 2002:a05:600c:35c5:b0:438:e231:d35e with SMTP id 5b1f17b1804b1-439248b6ebamr20948965e9.0.1738916038069;
        Fri, 07 Feb 2025 00:13:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm3167994f8f.6.2025.02.07.00.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:13:57 -0800 (PST)
Message-ID: <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
Date: Fri, 7 Feb 2025 09:13:56 +0100
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
X-CRM114-CacheID: sfid-20250207_001400_058870_6FD2A0A7 
X-CRM114-Status: GOOD (  14.99  )
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
YXRlLgo+IAo+IFRoaXMgcGF0Y2gganVzdCBlbmFibGVzIHRoZSBkZWZpbml0aW9ucyBhbmQgZW5h
YmxlIHBhcnNpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDIgKysK
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBpbmRleCBiNGVk
ZGNiNTc4NDIuLmZhNWUwMWJjYjk5MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBAQCAt
MTAzLDYgKzEwMyw4IEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NTUklORAkJOTQKPiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5ECQk5NQo+ICAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfU01DTlRSUE1GICAgICAgICAgOTYKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTQ0NGRyAg
ICAgICAgICAgIDk3Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRyAgICAgICAgICA5
OAo+ICAKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKPiAgCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDhmMjI1YzljMzA1NS4uM2NiMjA4ZDQ5MTNlIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0zOTAsMTIgKzM5MCwxNCBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAgCV9fUklTQ1ZfSVNB
X0VYVF9CVU5ETEUoenZrc2csIHJpc2N2X3p2a3NnX2J1bmRsZWRfZXh0cyksCj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAo+ICAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAo+ICsJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc21jZGVsZWcsIFJJU0NWX0lTQV9FWFRfU01DREVMRUcpLAoKSGkgQXRpc2gsCgpiYXNl
ZCBvbiB5b3VyIGR0LWJpbmRpbmcgY29tbWl0LCBpZiBzbWNkZWxlZyBkZXBlbmRzIG9uIFNzY3Ny
aW5kLCBaaWhwbSwKWmljbnRyLCB0aGVuIHlvdSBjb3VsZCBhZGQgYSB2YWxpZGF0aW9uIGNhbGxi
YWNrIGhlcmU6CgpzdGF0aWMgaW50IHJpc2N2X3NtY2RlbGVnX3ZhbGlkYXRlKGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEKKmRhdGEsIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRt
YXApCnsKCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJ
U0NWX0lTQV9FWFRfU1NDU1JJTkQpICYmCgkgICAgX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSAmJgoJICAgIF9fcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9aSUNOVFIpKQoJ
CXJldHVybiAwOwoKCXJldHVybiAtRVBST0JFX0RFRkVSOwp9CgpfX1JJU0NWX0lTQV9FWFRfREFU
QV9WQUxJREFURShzbWNkZWxlZywgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRywKcmlzY3Zfc21jZGVs
ZWdfdmFsaWRhdGUpLAoKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY250cnBtZiwgUklTQ1Zf
SVNBX0VYVF9TTUNOVFJQTUYpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jc3JpbmQsIFJJ
U0NWX0lTQV9FWFRfU01DU1JJTkQpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJ
U0NWX0lTQV9FWFRfU01NUE0pLAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNtbnBtLCBS
SVNDVl9JU0FfRVhUX1NNTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01TVEFURUVOKSwKPiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKPiArCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcpLAoKRGl0dG8gZm9y
IHRoaXMgb25lIHdpdGggU21jZGVsZWcsIFNzY3NyaW5kLCBaaWhwbSwgWmljbnRyLCBTc2NvZnBt
ZiwKU21jbnRycG1mLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCj4gIAlfX1JJU0NWX0lTQV9FWFRf
REFUQShzc2NzcmluZCwgUklTQ1ZfSVNBX0VYVF9TU0NTUklORCksCj4gIAlfX1JJU0NWX0lTQV9F
WFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hsaW51eGVudmNm
Z19leHRzKSwKPiAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
