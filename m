Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31335C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmRekUqXL4+DGFDrhYj8aTznQWUGaAoyTuOCezODHnc=; b=FU9+dYtUSpED+x
	SOx6qB4Z/+BClvLkyU+nyk/l/T2xP3HI524AHvVYcwBIFXn4c7rb54kWZdf5JvI+m61aCinSKtU5m
	szFOaI0eNaGwEiyvzZD16xqbU6I3CmffT3ePTK/sBUAmZ0GqVpmfd4hVI6JHSsCm7IcRa3qPY2FRo
	Nj7MLjvIoQjWaVy0VCmf0HWOrvZaZN70QITxDUotRj9rMN+1vBhc4f6HM2yyViTrl0z+iJjo66DNl
	hHxrmImE4HeE/QYe9IVRIHieInjLi/1Uo78i3SaVNtpf/IShrufLEzzqQtYJkujhNAEV9uOxgdvSP
	62S8ZYWKpyq3YHl7xhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wwn-0000000EFGx-2Q9A;
	Thu, 24 Apr 2025 13:49:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vkK-0000000E2uP-1Tbh
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:32:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1227263f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745497922; x=1746102722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=FS5HjmdEwxUlYYv/rduNTydAjnALP7BAtbqc9dsZlQnbimHvBrbgErwQkwB2YUdGtT
         sWmJVspyIC8c6uqFuXHdq7UaXgmGGP3QrYA1dttcRowpNF7VWPWFOYD8Is+z3az/Q0Bz
         XfrpZrYuzo5zuVJWKbFjgj6KU/q9B3hHC7B2BO4/DmrA34StgjC+xEFWnQJtE7YFHdFg
         FbuA4dM1NixAUap/dJz9ycJoco1uzBOJA7mZfq4VK++czQ65FK5iBDPjWlqOkqG3S9R+
         5MX34wLvFu2wNj7En3gN3h+PDc1lAn/jVU+E27aLFZJZ/MnyxfL2QGVejZVUyoa74dmu
         mu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497922; x=1746102722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=tMjkm6PgWo7D4127AEhMdtr5TTYJGQzSxfcuWQUZz19F7SAlwmhjaA/2ebf5/O2zAD
         wPNWbjzcsMvNX27wIu+ey2LxFri+mXQFu1ayXyl2pXivozfTnWJz9BVRTuitS/n9TtCx
         Og75L6Y7uNaBtUR3Se/T2BdPwAxM1iA1ao0J2Q38eL/8QY8tDvNYoc4xNxJLQZc3Wq2W
         hGYoy9B62JsAEQ97bBDoibe/t9nxubWPSEfq3HoJE/81An2Jpbebq4FNVdTYaXP9yUvc
         8nukOH4aAVBx1GfATZ/THnAyZAxZDew/WsuNTPGUqha/MBjDFv6/IpeRUNZVfVet9upC
         x8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWwU2U3OUmw8c2KnoK7br9Gu/FDXxaVldnSLEI5j4j8SOkTeImKuVsl2qmlm8Lsw/dweE6h4UOMonA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCrcP+oPCqpEfwfMvKfWq/aZpXhjb18XAGJ4WAOrfSGgdLuoNO
	eO9QkItU4yaUrWZroW2oVo8kFkEFU9KkMGJJqdPYe589tELVXSujmt33gJoY4X4=
X-Gm-Gg: ASbGncsjhGn04rclE0j+Tb3rTPgb8G5laqgtIGC3GJIFEerFj7AHiBKX3R9XNpoKEAu
	VxMKeg7jaF9z4cGfhU2qY1IWoXpzgq+F+ZLr3l/J2nnDN8xrxZ6a489nmimCrQXguXv0g6Kqm+b
	abZgFGPuvYFkVTFM2sSh0aUE7+EJNrKabVO2uwnW0wOj6FbXVoEiR48apPa2twoJoFN9PnYp8X7
	m9Vyur0VMdZVNAkBqhABKgsicyzjuPA8IkySbXXHaN8F9U9ghYuSLMd/HowPCJrwOO3HrosRgaF
	bC7mp6zktyKYnTC/vXPOFiLKkxlpmdxKnMiGPNiNlzByQvsmk8e9HBSiHDQvyWQiXm0GzvsHRV4
	ij3ACyUKxoA==
X-Google-Smtp-Source: AGHT+IFbJZjPmuMD3YIQwLoJ857azwRhf/epJ6CxLQ+gyc15vU+Ezwb55G76EYJKFKkcG3RmozFEJg==
X-Received: by 2002:a05:6000:2911:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-3a06cf5ede6mr2159263f8f.25.1745497922377;
        Thu, 24 Apr 2025 05:32:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4b52sm1997065f8f.55.2025.04.24.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:32:01 -0700 (PDT)
Message-ID: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
Date: Thu, 24 Apr 2025 14:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c85c9d2f189fe4470038b519@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_053204_586740_D0332751 
X-CRM114-Status: GOOD (  14.39  )
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

CgpPbiAyNC8wNC8yMDI1IDEzOjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTcsIDIwMjUgYXQgMDI6MTk6NTBQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGlzIFNCSSBleHRlbnNpb25zIGVuYWJsZXMgc3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVh
dHVyZSB0aGF0IGFyZQo+PiB1bmRlciBNLW1vZGUgY29udHJvbCAoRm9yIGluc3RhbmNlLCBTdmFk
dSBtZW52Y2ZnIEFEVUUgYml0LCBTc2RibHRycAo+PiBEVEUsIGV0YykuIEFkZCBhbiBpbnRlcmZh
Y2UgdG8gc2V0IGxvY2FsIGZlYXR1cmVzIGZvciBhIHNwZWNpZmljIGNwdQo+PiBtYXNrIGFzIHdl
bGwgYXMgZm9yIHRoZSBvbmxpbmUgY3B1IG1hc2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCB8IDE3ICsrKysrKysrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YyAgICAgIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+IGlu
ZGV4IDdlYzI0OWZlYTg4MC4uYzhlYWIzMTVjODBlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
Pj4gQEAgLTUwMyw2ICs1MDMsMjMgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNlX3Z2bWFfYXNpZChj
b25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4+ICAJCQkJdW5zaWduZWQgbG9uZyBhc2lk
KTsKPj4gIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKPj4gIAo+PiAraW50IHNi
aV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9u
ZyBmbGFncyk7Cj4+ICtpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFz
a190ICptYXNrLCB1MzIgZmVhdHVyZSwKPj4gKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVl
LCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKPiAKPiBJJ20gY29uZnVzZWQgYnkgdGhlIG5hbWluZyB0
aGF0IGluY2x1ZGVzICdsb2NhbCcgYW5kICdjcHVtYXNrJyB0b2dldGhlcgo+IGFuZC4uLgo+IAo+
PiArLyoqCj4+ICsgKiBzYmlfZndmdF9sb2NhbF9zZXQoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxs
IG9ubGluZSBjcHVzCj4+ICsgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8gYmUgc2V0Cj4+ICsg
KiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAo+PiArICogQGZsYWdzOiBGV0ZU
IGZlYXR1cmUgc2V0IGZsYWdzCj4+ICsgKgo+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFw
cHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+PiArICovCj4+ICtzdGF0aWMg
aW5saW5lIGludCBzYmlfZndmdF9sb2NhbF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcg
dmFsdWUsCj4+ICsJCQkJICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKQo+PiArewo+PiArCXJldHVy
biBzYmlfZndmdF9sb2NhbF9zZXRfY3B1bWFzayhjcHVfb25saW5lX21hc2ssIGZlYXR1cmUsIHZh
bHVlLCBmbGFncyk7Cj4gCj4gLi4udGhhdCBzb21ldGhpbmcgbmFtZWQgd2l0aCBqdXN0ICdsb2Nh
bCcgaXMgYXBwbGllZCB0byBhbGwgb25saW5lIGNwdXMuCj4gSSd2ZSBhbHdheXMgY29uc2lkZXJl
ZCAnbG9jYWwnIGZ1bmN0aW9ucyB0byBvbmx5IGFmZmVjdCB0aGUgY2FsbGluZyBjcHUuCgpZZWFo
IEkgdGhvdWdodCBvZiB0aGF0IGFzIHdlbGwsIGxvY2FsIGhlcmUgcmVmZXJzIHRvIHRoZSBmYWN0
IHRoYXQgdGhpcwpmdW5jdGlvbiBhcHBsaWVzIGZvciBhIGxvY2FsIGZlYXR1cmUgKGFzIGRlc2Ny
aWJlZCBpbiB0aGUgU0JJCmRvY3VtZW50YXRpb24pIGJ1dCBhZ3JlZWQgdGhhdCBpdCdzIHJlYWxs
eSBtaXNzbGVhZGluZy4gQW55IGlkZWEgZm9yIGEKYmV0dGVyIG5hbWluZyA/CgpUaGFua3MsCgpD
bMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
