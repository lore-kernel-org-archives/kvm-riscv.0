Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF18E77197
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 17:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SiX+SDBstdOELLsWPJy93jFupMsSiDXEWlWZR90lhA=; b=ydYZxrcic17XDF
	1dYxZrsoVUilnL5SsuPD/EOaNH6t9szBWHiPHsT9Tz9IYk7SWI5D3iKbO9Y9xiIJrou6sh17LDlJg
	Wr0LimXLaBFhga8By/ao3QvZNipzLd0pAhD+8M8UCj1Or24J+xnrQVgKxuUbn7MV6GBNkTOdJYcXn
	2nUJKdY2+YLlppXSxiGPunEJOlXF4vFSFFtnax5tNh23zCRD9Wlb2/EKl/4Cn3LLvdXZbC/WFlwE2
	GxhlsRR+kxd8BEu/3YRMleFYHBfUpEKIPteOLA7zsytzTXdO/lX79z1oehnwhQaafTsGZN4J4HNLr
	hxT3kgG9DR7+93AbTiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDfg-00000005uPc-01UR;
	Tue, 07 Jan 2025 17:47:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDSs-00000005sQp-27AZ
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 17:34:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f441904a42so23555773a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jan 2025 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736271241; x=1736876041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8chiWn8PHgcoyJVQOgate9PsARC7jUqDb+rR2Mrr+VA=;
        b=NOckLmco+b96h3mkgpjx8WVsY/c8SYBGSNPoyF4Ge+YVowTT/6FdiJuA6TMT4Si/hm
         412ENF6sV5gzU00nP08GwuYfgQCaPeVt84aX5gSq3PlvxFzvWGbf4ZkAAFCyVKadvhRg
         qufY7R4zft/cJivunNl5DdmhjwPN/u2+X7on620hu9hKB5Tay+EK0+BInRwRs2FGyBcO
         4PnaPhqSOjS8kqNx2zICjvCV5VGJNm1y4UyZLrR2u+exdxHzWuWwztHH9hOXmq4h+1J4
         TTUl3VR5LkLLJgRxqxL/BW9e8f6qzt34QTnUagaWqCvdMcOXCwt5Dpn3YO8F9pL98TRm
         6+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271241; x=1736876041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8chiWn8PHgcoyJVQOgate9PsARC7jUqDb+rR2Mrr+VA=;
        b=gIrTSu7SLXCg9DO9RSUj58oc1Y8PUfhMlld049ABvqKHAao6pl3Xjtw6RfpFSL9KKi
         dsYvhzKIkDXkR4pBo94Mfag8+FYGLC6mVRLUcOHGAZ1t8oizN0nxdNvUdCruDSf7tncs
         NcUafrRekHVNzqMt3RrXHAqdjGGnxxXaJL8DdKr4J0UknQ1DXDelu0kf42OmfoP6is91
         pq7be7SgfAPdoERLEP16kK15I6ilo0ObcWUE037jMHcojyFdczaUmOtouI3P9H2dd/kl
         ojD41HmMBYc7M3iEbQ1vGdLgLoWdcn8AL3JxuRPr2WrMNaKvJqaz0Hf5sGvACSIOhjB1
         9DYg==
X-Forwarded-Encrypted: i=1; AJvYcCWhXp8p4t8GtYm9YGuMOgsF9Htd+urgHueO7Ghtv+akxQQBK/VdElJD6Xe6YMh8Wx4NCLxkMgyRG5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNasibioFJSJzq/Rm3eoqT+sDZacEt2mxtAsa2r3898K2pnLFM
	FYEN63BNMvSa3zw6NvdCUCFmiDO9BohYwm3mMbiWJoR8BpAHyBITH6xBZaWq21U=
X-Gm-Gg: ASbGncuFhpJi9OqocBz0qzwbfkphMIyOEb/xXZt1rwRyQ89YuIBmnC6R6mTa0/EzBBY
	bIp16A4dGmSUGhsAMFUKGGnw+NbF1x+sRfFx5qArY+raQnPdxp8abIcsUGVpESo1gPJunMu+w8l
	s1B1TUgXyHT9G+q3hmH6xPOjGnSt0opzKSAHD16AlGHKyGELT1onXHMhtZUUpfpKMfunipg6IZE
	DFxtoh7RJpx2xAhd1tpyE7vh6Ng3cgJNvcAhTPBpqYstcH9BUNf47HGR3B8TsZA95KC07rKmBmB
	1WrML4mjRsXjsJY+nVj3RdmUcw==
X-Google-Smtp-Source: AGHT+IGpFaqKxwP+asxFbBD1Yj7PsO+fRwK1mkugnP7ZKu1AjJHchKThe8xppLAgUTKIrZ/vqEzIiA==
X-Received: by 2002:a17:90b:2c84:b0:2ea:a25d:3baa with SMTP id 98e67ed59e1d1-2f452dfa40bmr97211846a91.5.1736271240898;
        Tue, 07 Jan 2025 09:34:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478ac7dbsm36191474a91.50.2025.01.07.09.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:34:00 -0800 (PST)
Message-ID: <25e8e0c6-c9d4-4c98-ae02-284db0175d82@rivosinc.com>
Date: Tue, 7 Jan 2025 18:33:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 2/5] riscv: use asm-offsets to generate
 SBI_EXT_HSM values
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
 <20241125162200.1630845-3-cleger@rivosinc.com>
 <20250107-feb21efc4c0815bd3ed7b173@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250107-feb21efc4c0815bd3ed7b173@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_093402_754904_13056D54 
X-CRM114-Status: GOOD (  18.94  )
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

CgpPbiAwNy8wMS8yMDI1IDE4OjI3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MjUsIDIwMjQgYXQgMDU6MjE6NTFQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBS
ZXBsYWNlIGhhcmRjb2RlZCB2YWx1ZXMgd2l0aCBnZW5lcmF0ZWQgb25lcyB1c2luZyBhc20tb2Zm
c2V0LiBUaGlzCj4+IGFsbG93cyB0byBkaXJlY3RseSB1c2UgQVNNX1NCSV9FWFRfSFNNIGFuZCBB
U01fU0JJX0VYVF9IU01fU1RBUlQgaW4KPiAKPiBBU01fU0JJX0VYVF9IU01fSEFSVF9TVE9QCj4g
Cj4+IGFzc2VtYmx5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgcmlzY3YvTWFrZWZpbGUgICAgICAgICAgIHwgIDIg
Ky0KPj4gIHJpc2N2L3NiaS1hc20uUyAgICAgICAgICB8ICA2ICsrKystLQo+PiAgcmlzY3YvYXNt
LW9mZnNldHMtdGVzdC5jIHwgMTIgKysrKysrKysrKysrCj4+ICByaXNjdi8uZ2l0aWdub3JlICAg
ICAgICAgfCAgMSArCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3YvYXNtLW9mZnNldHMtdGVzdC5j
Cj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3YvLmdpdGlnbm9yZQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvcmlzY3YvTWFrZWZpbGUgYi9yaXNjdi9NYWtlZmlsZQo+PiBpbmRleCAyOGIwNDE1Ni4uYTAx
ZmY4YTMgMTAwNjQ0Cj4+IC0tLSBhL3Jpc2N2L01ha2VmaWxlCj4+ICsrKyBiL3Jpc2N2L01ha2Vm
aWxlCj4+IEBAIC04Niw3ICs4Niw3IEBAIENGTEFHUyArPSAtZmZyZWVzdGFuZGluZwo+PiAgQ0ZM
QUdTICs9IC1PMgo+PiAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9saWIgLUkgJChTUkNESVIpL2xp
Yi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgo+PiAgCj4+IC1hc20tb2Zmc2V0cyA9
IGxpYi9yaXNjdi9hc20tb2Zmc2V0cy5oCj4+ICthc20tb2Zmc2V0cyA9IGxpYi9yaXNjdi9hc20t
b2Zmc2V0cy5oIHJpc2N2L2FzbS1vZmZzZXRzLXRlc3QuaAo+PiAgaW5jbHVkZSAkKFNSQ0RJUikv
c2NyaXB0cy9hc20tb2Zmc2V0cy5tYWsKPj4gIAo+PiAgJS5hdXgubzogJChTUkNESVIpL2xpYi9h
dXhpbmZvLmMKPj4gZGlmZiAtLWdpdCBhL3Jpc2N2L3NiaS1hc20uUyBiL3Jpc2N2L3NiaS1hc20u
Uwo+PiBpbmRleCA5MjNjMmNlYy4uMTkzZDk2MDYgMTAwNjQ0Cj4+IC0tLSBhL3Jpc2N2L3NiaS1h
c20uUwo+PiArKysgYi9yaXNjdi9zYmktYXNtLlMKPj4gQEAgLTcsNiArNyw4IEBACj4+ICAjZGVm
aW5lIF9fQVNTRU1CTFlfXwo+PiAgI2luY2x1ZGUgPGFzbS9hc20uaD4KPj4gICNpbmNsdWRlIDxh
c20vY3NyLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+Cj4+ICsjaW5jbHVkZSA8
Z2VuZXJhdGVkL2FzbS1vZmZzZXRzLXRlc3QuaD4KPj4gIAo+PiAgI2luY2x1ZGUgInNiaS10ZXN0
cy5oIgo+PiAgCj4+IEBAIC01OCw4ICs2MCw4IEBAIHNiaV9oc21fY2hlY2s6Cj4+ICA3OglsYgl0
MCwgMCh0MSkKPj4gIAlwYXVzZQo+PiAgCWJlcXoJdDAsIDdiCj4+IC0JbGkJYTcsIDB4NDg1MzRk
CS8qIFNCSV9FWFRfSFNNICovCj4+IC0JbGkJYTYsIDEJCS8qIFNCSV9FWFRfSFNNX0hBUlRfU1RP
UCAqLwo+PiArCWxpCWE3LCBBU01fU0JJX0VYVF9IU00KPj4gKwlsaQlhNiwgQVNNX1NCSV9FWFRf
SFNNX0hBUlRfU1RPUAo+PiAgCWVjYWxsCj4+ICA4OglwYXVzZQo+PiAgCWoJOGIKPj4gZGlmZiAt
LWdpdCBhL3Jpc2N2L2FzbS1vZmZzZXRzLXRlc3QuYyBiL3Jpc2N2L2FzbS1vZmZzZXRzLXRlc3Qu
Ywo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMC4uMTE2ZmU0OTcKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9yaXNjdi9hc20tb2Zmc2V0cy10ZXN0LmMKPj4gQEAgLTAs
MCArMSwxMiBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+
PiArI2luY2x1ZGUgPGtidWlsZC5oPgo+PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4gKyNpbmNs
dWRlICJzYmktdGVzdHMuaCIKPj4gKwo+PiAraW50IG1haW4odm9pZCkKPj4gK3sKPj4gKwlERUZJ
TkUoQVNNX1NCSV9FWFRfSFNNLCBTQklfRVhUX0hTTSk7Cj4+ICsJREVGSU5FKEFTTV9TQklfRVhU
X0hTTV9IQVJUX1NUT1AsIFNCSV9FWFRfSFNNX0hBUlRfU1RPUCk7Cj4+ICsKPj4gKwlyZXR1cm4g
MDsKPj4gK30KPj4gZGlmZiAtLWdpdCBhL3Jpc2N2Ly5naXRpZ25vcmUgYi9yaXNjdi8uZ2l0aWdu
b3JlCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwLi45MTcxMzU4MQo+
PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3Jpc2N2Ly5naXRpZ25vcmUKPj4gQEAgLTAsMCArMSBA
QAo+PiArL2FzbS1vZmZzZXRzLXRlc3QuW2hzXQo+PiAtLSAKPj4gMi40NS4yCj4+Cj4gCj4gSSBs
aWtlIHRoaXMgYW5kIEkgc2hvdWxkIHByb2JhYmx5IHJld29yayBzdHVmZiB0byByZXBsYWNlIGFs
bCB0aGUgX0lEWAo+IG1hY3JvcyBpbiByaXNjdi9zYmktdGVzdHMuaC4gSSB0aGluayB3ZSBzaG91
bGQgY2FsbCBpdCBzYmktYXNtLW9mZnNldHMuYywKPiB0aG91Z2gsIGFuZCB0aGVuIGNoYW5nZSB0
aGUgTWFrZWZpbGUgYW5kIC5naXRpZ25vcmUgY2hhbmdlcyB0byByZWZlciB0bwo+IHJpc2N2Lyot
YXNtLW9mZnNldHMuaC4gVGhhdCB3b3VsZCBhbGxvdyB1cyB0byBrZWVwIHRlc3Qtc3BlY2lmaWMg
YXNtLQo+IG9mZnNldHMgc2VwYXJhdGUgYW5kIGF2b2lkIHRoZSBuYW1lICJhc20tb2Zmc2V0cy10
ZXN0IiBvciBzaW1pbGFyIHdoaWNoLAo+IHRvIG1lLCBjb252ZXlzIGl0J3MgZm9yIHRlc3Rpbmcg
YXNtLW9mZnNldHMuCgpZZXMgaW5kZWVkLCB0aGF0IHdpbGwgYmUgY2xlYXJlci4gSSdsbCB0YWtl
IGNhcmUgb2YgdXBkYXRpbmcgdGhlIGZpbGUKbmFtZSBhcyB3ZWxsIGFzIHRoZSBnaXRpZ25vcmUg
aW4gdGhpcyBzZXJpZXMuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
