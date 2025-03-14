Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA68C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vx1WBZkw6zHuyn2NEevdhrK8Yb7AQG9MHLJoZEVkTRg=; b=hvW5wmzVf/5P3w
	OISuzeWdgO433XoL+HSlFW4TJf8N6uVrKejwnSqnbjXNnsyOEwkSL5bHsnsBd2pgFU54K5Ya8nwDg
	oxCoV+NFswCC9zFebcWZr61wZ/Q9oP0X+UIV+16AUt/UGI4qL4OhCWEOwINoTqhIm2b70N9aU021J
	XjGdXF9K58+wg2hnE8cCqr70WCOmKr9O3eI3p3RZaYhj+LhD+rIuaoS80vEdeQ2hwnNohTSHMe6GV
	U+L87Wy3Q4r0qK14WtBCTVvTQ/q9MpCtn6JszgwsvoNH3Cd7BVBx0D16zY21+XuU/2p+VqJ4ovSRO
	RApRg33yssySIJbfZliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Xc-0000000E42X-1suY;
	Fri, 14 Mar 2025 11:49:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3XZ-0000000E41R-29s4
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:49:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13455745e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952964; x=1742557764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnZSC151vp8qwLt12oXOY4820tmPnxSjOaRjWV8Cing=;
        b=K/k+Ko8ye5pbRYfWEQA1GeNqR1p7auP2V1g0N8uUYDJzcRc9XE5fgvvOioXa+KqXab
         CA+vO0stf7HNn3Q/8LjLGG+ogLbWLKYps5CaRqZ8BKNUxzga7dERqs0vgdLgIoX1/hWO
         bZOsRX20BykFYtYRmV65z/25+IbLgKdPzLDRVcMW0POg1Lm0kOx1v4imDALqmH2rwUiz
         jw3YpShvrRFfRK/sOBRmp4J55VDpVO+FWeXOZuOGZtdE1HS4UXJH3gynR/WeZ6mfKY1L
         i/0NB7XhjN9vDhxi9DeRoKCE69j+v812b1QlmeMjAr7xFdmTIWG8hJ5UZgPDqZ03Lh+A
         vViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952964; x=1742557764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnZSC151vp8qwLt12oXOY4820tmPnxSjOaRjWV8Cing=;
        b=VOZtjDA0h5VAX7T8F8EjYCu5tqq3OYusn7qXy7iYujrcxBVpnncsvelkALRI+q/C6n
         ZcrX9+MuXZawOdkiXQOGcf/w/LvMKKkXi+h81VE0mIw9YqJtR03Gg/M7XPYWZxqu9XyY
         7ajGjGw0jSPsfIRmxfgt0e4mL+yNunfT26s9JA1wqNnSaKuuyyoa/LZ4ezFdDohLwXG3
         zwy052BWkBkAjesmah6EOB0fCSBk4ugCTLyTYAITwxrGznclTjIjMuIp5ZcGw2DTls8U
         JD34PbjvS4ZleILDAARPAe3V7zksD8gsumGsegRIL4qGetKSDrb0EnR0x3OjcuktjJa9
         4kWg==
X-Forwarded-Encrypted: i=1; AJvYcCVNiznQg+sYZPu8mu1HOzNuj2h+Z6RoF9BoRvGQ2DiA98hju8eUDIob7QqSoncJmqyNgvFBB9HyzZk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVP2S8cSh3NsZLIWa8vKFrY+KYX2USGoWQRXH2jBax3DGRIv7W
	ntz+m4vKUXQysf8fjg7k+QERextOc9AWDgISfCmnBRjRUwtAp/gv/5ZvrmPgVz8=
X-Gm-Gg: ASbGncs7fJswGh5hmo0YBzTl7QBWibb0JYu5XP9R69RC+Kl3wQjMu1ttZ4iEAvR425V
	RfI7HlQyAXpysZ1lkfFAs8P4/DcQCMUb7ik0xbw8jqx2OEfgp4xNzH5I7/fPV7B6gsv1ZAJMHaE
	bKaqehX1HG7vAL1cS5wNAFt9uWiSbqjXyrdUqYbEg9EQsqbT6LVl0u8CMIF7ksSuHkUeeno5shj
	sWvuGxUquYL0EOouR/7Fi+zYWqfJBAKyghkbmEXE60CjcrtheYxYChxzaTYrF6DIFSpkq/wsThT
	GOv2C3kVLew6ka1/zUnHHneHw+tn7iDdPUFfVLFZh2vbFwFBvZuo+3Fvm0jpPlCBe62qnEKXrE3
	YkbGgr5WEfAH4qQ==
X-Google-Smtp-Source: AGHT+IFooexJGdlE71HjFHejmIN5yPGDOB48jansbCISOaAARNem81Cu631A445Q7st6CHhGvoNF9A==
X-Received: by 2002:a05:600c:5105:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d225b23e7mr10331325e9.13.1741952963792;
        Fri, 14 Mar 2025 04:49:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb92csm5408510f8f.91.2025.03.14.04.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:49:23 -0700 (PDT)
Message-ID: <7073c4de-4735-429b-b520-f18c33ecaab7@rivosinc.com>
Date: Fri, 14 Mar 2025 12:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/17] riscv: misaligned: add a function to check
 misalign trap delegability
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-9-cleger@rivosinc.com>
 <20250313-4bea400c5770a5a5d3d70b38@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-4bea400c5770a5a5d3d70b38@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044925_646588_F00FD004 
X-CRM114-Status: GOOD (  16.21  )
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

CgpPbiAxMy8wMy8yMDI1IDE0OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTVQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBD
aGVja2luZyBmb3IgdGhlIGRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3MgdHJh
cCBpcyBuZWVkZWQKPj4gZm9yIHRoZSBLVk0gRldGVCBleHRlbnNpb24gaW1wbGVtZW50YXRpb24u
IEFkZCBhIGZ1bmN0aW9uIHRvIGdldCB0aGUKPj4gZGVsZWdhYmlsaXR5IG9mIHRoZSBtaXNhbGln
bmVkIHRyYXAgZXhjZXB0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmggIHwgIDUgKysrKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyB8IDE3ICsrKysrKysrKysrKysrKy0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oCj4+IGluZGV4IGFkN2QyNjc4OGU2YS4uOGI5N2NiYTk5ZmMzIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiBAQCAtNjksMTIgKzY5LDE3IEBAIGludCBjcHVf
b25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KTsKPj4gICNpZiBk
ZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKPj4gIHZvaWQgdW5hbGlnbmVk
X2VtdWxhdGlvbl9maW5pc2godm9pZCk7Cj4+ICBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxl
KHZvaWQpOwo+PiArYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lkKTsKPj4g
IERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7Cj4+ICAjZWxz
ZQo+PiAgc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCj4+
ICB7Cj4+ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+PiArc3RhdGljIGlubGluZSBib29sIG1pc2Fs
aWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIGZhbHNlOwo+
PiArfQo+PiAgI2VuZGlmCj4+ICAKPj4gIGJvb2wgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKPj4gaW5kZXggZGIzMTk2NmE4MzRlLi5hNjdhNmU3MDlhMDYgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gQEAgLTcxNiwxMCArNzE2LDEwIEBAIHN0YXRp
YyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVuc2lnbmVk
IGludCBjcHUpCj4+ICB9Cj4+ICAjZW5kaWYKPj4gIAo+PiAtI2lmZGVmIENPTkZJR19SSVNDVl9T
QkkKPj4gLQo+PiAgc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7Cj4+ICAK
Pj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCj4+ICsKPj4gIHN0YXRpYyBpbnQgY3B1X29ubGlu
ZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUpCj4+ICB7Cj4+ICAJaWYgKHNi
aV9md2Z0X3NldChTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgMSwgMCkgJiYKPj4gQEAg
LTc2MSw2ICs3NjEsNyBAQCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1
cCh1bnNpZ25lZCBpbnQgY3B1IF9fYWx3YXlzX3VudXNlZCkKPj4gIHsKPj4gIAlyZXR1cm4gMDsK
Pj4gIH0KPj4gKwo+PiAgI2VuZGlmCj4+ICAKPj4gIGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9h
Y2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQo+PiBAQCAtNzczLDMgKzc3NCwxNSBAQCBpbnQg
Y3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNwdSkKPj4gIAo+
PiAgCXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoY3B1
KTsKPj4gIH0KPj4gKwo+PiArYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KQo+PiArewo+PiArCS8qCj4+ICsJICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQg
bWlzYWxpZ25lZCB0cmFwcyBkZWxlZ2F0aW9uIGZvciBhbGwKPj4gKwkgKiBDUFVTIG9yIHRoZSBT
QkkgZG9lcyBub3QgaW1wbGVtZW50ZWQgRldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZCB0aGUK
Pj4gKwkgKiBleGNlcHRpb24gYnkgZGVmYXVsdC4KPj4gKwkgKi8KPj4gKwlyZXR1cm4gbWlzYWxp
Z25lZF90cmFwc19kZWxlZ2F0ZWQgfHwKPj4gKwkgICAgICAgYWxsX2NwdXNfdW5hbGlnbmVkX3Nj
YWxhcl9hY2Nlc3NfZW11bGF0ZWQoKTsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKG1pc2Fs
aWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsKPj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxl
Cj4gCj4gQ2hlY2sgeW91ciBlZGl0b3Igc2V0dGluZ3MuCgpJIGp1c3QgZW5hYmxlZCBFZGl0b3JD
b25maWcgYXMgd2VsbCBhcyBjbGFuZy1mb3JtYXQgc28gaG9wZWZ1bGx5IHRoYXQKd2lsbCBiZSBv
ayBpbiB0aGUgbmV4dCBzZXJpZXMuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gLS0gCj4+IDIu
NDcuMgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
