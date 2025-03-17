Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842EC35FF3
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2O4qIIl23d0L++PtKZl406m1hjRuSqsdbxqvtpYmqs=; b=vCwK5709bTfG28
	XW2EKcwArFK93JxZm+GtRbNPL9hacDTKYRIFlzVDC0fO3X2JN2zPU8hnvRU+X4aXTx629EC44KqSU
	gNsw6XW1KPQYX3Jnqg/SyFdC8YkQlANjgiRSQ1Vrzqp5KvduZVKEOcHlDhMajXvBHKRfGp1ubA79A
	dbqNSwrVFtTScDJslmnGE8nFZAUNb3WF7RAvzQxRXAAkAs760Rjvb1aq4jW8vQG061adjrQWj+GDb
	T4EgU26y6uxMc69FOWN8FZAfLhc97DUk/WjViMkolD1PLSZpgSlcGDIY8AmXYPck+hSD3okby7hk5
	u+iflVXl6VwxXJwIlCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA1M-00000002e0B-3rDe;
	Mon, 17 Mar 2025 12:56:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9sG-00000002cWM-0iLu
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:47:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so9107405e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742215639; x=1742820439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNJD2cRSyRbB5NBj1+laiOZcJuLA5D201yQLNYffdog=;
        b=0C5esLYhOuP/YX8mj5AMskwWeoifVNUv0IhizTZpW38reK+ExScKaEKllXw4sLg3+0
         4gKq0ylAZXN09o4K+uLPYuJaq3MqfWjzq0FVWrdzJo0ZXe3iEe9Lniug7UJM2obYnwuk
         fiON1wdjEgErsET842JFLQmLzwzLU+QZ9EyZ8Cnd4bPeBNDpLJtzsTnxQErmL/Qqpyoi
         Xm7melNiS7K0HETRXyayuv8AgduDjBZ2h/zIbIDBdUF4Wrqy+geoxbbvylGCz7Xp01Rf
         be45da1ukrNo5BVOBExSGk4BY91ZYvoo83sGGs+frZ8a+7XrEr+b2xoUDe8hPEqISVm3
         2E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742215639; x=1742820439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNJD2cRSyRbB5NBj1+laiOZcJuLA5D201yQLNYffdog=;
        b=hBSr6BkVJo3dBWWWxacVGMU+MTLHg9O6o1vwOHoqJll2tqYQP4+/X6uU8RJJQhp5dI
         ATbfz2iDb1X5GqYfrjvEtba03vcUs2WlQ4ErhUNh4A7hWwx/8aAVLxzjO+aL/IoVnWad
         uxH2eDEQlMyIb2GqIAju96VHhep0nzBbSaB6135cVhWtB3yCMzhZctlE2/hGu0QsxD+w
         QA6awWuW43epCWxo9OlXEibw2VklkhsI8OvnF7v3ZnJIBWyqyDPF8gR96NhXtg4ST6Xp
         cV2Z4CjFqBwDXJpUtRwuDqNBcekPk4oSsMpzFtVyjQY5ghKUU48VLr29D6WxUIjvWczi
         sfWA==
X-Forwarded-Encrypted: i=1; AJvYcCVOWMESO2qa6LrH+ggtklZxGFDTecXs8ysm7ERsdmbNfwvh4LVEiVW1wf//93pC3DMk5pBvHBFzZgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNDNDVO4GnPslBBiJF6H8dXjh4OsVyPfVAmnDH4/UvBj+FpW7y
	ItAzmJ5BZG2LJ0X+Rg3ZNcVZTwRMcUdY+7ojUFyOk8Rw8InHU3Ou00buT1aWP5k=
X-Gm-Gg: ASbGncuzU7jA1Hw8J6tooo6QQ0RK1CZLM8dPxGUkiDj/iO6EeW5g/K02WoM4IqGU4DW
	LqJdYSb1/612M+1YjOZZgTL4JAoI7px8QHJQDYFoViN16Mi5AIl7W9EV0d4YI6E6OLoY5Q6C4yA
	rUHD9ewndMpjBeyxlF/OxnzzZoQyiyptBrCc3U55PARNKRh7wSknPVoUg2CXzG0BAkhvRV/UHUR
	VDGC6i1pse4gemh7Lz+3CSBEgI5cmbVNamehq7ooLp+zgipZCY+DyvY9Dsn0+Dg9PaEYsuHbmqC
	HHZiF4e8RaSb+aciRoPDDfwoZ8XhG8xvp6BKnTtw4OYdDoPCPkQTD8bQ8oYPWk5RTDF8xaJaM0a
	A61atqy40tXKYhA==
X-Google-Smtp-Source: AGHT+IEpuZB6qKXRMWj6Y8pohvlV6juT354mMXjwcMi8bCRONHm/KMR9R3MClLuFKOqk4e3NYgN1FQ==
X-Received: by 2002:a5d:6484:0:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-3971f9e79fcmr14508312f8f.40.1742215638546;
        Mon, 17 Mar 2025 05:47:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebaa5sm14812406f8f.87.2025.03.17.05.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:47:18 -0700 (PDT)
Message-ID: <2214520b-4ee8-4147-806b-d25f3fc324fe@rivosinc.com>
Date: Mon, 17 Mar 2025 13:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v10 5/8] lib: riscv: add functions to get
 implementer ID and version
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
 <20250317101956.526834-6-cleger@rivosinc.com>
 <20250317-a53b74017397269b474dd6b9@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250317-a53b74017397269b474dd6b9@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054720_449009_81610BD0 
X-CRM114-Status: GOOD (  17.88  )
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

CgpPbiAxNy8wMy8yMDI1IDEzOjQ2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTcsIDIwMjUgYXQgMTE6MTk6NTFBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGVzZSBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgYnkgU1NFIHRlc3RzIHRvIGNoZWNrIGZvciBhIHNw
ZWNpZmljIG9wZW5zYmkKPj4gdmVyc2lvbi4gc2JpX2ltcGxfY2hlY2soKSBpcyBhbiBoZWxwZXIg
YWxsb3dpbmcgdG8gY2hlY2sgZm9yIGEgc3BlY2lmaWMKPj4gU0JJIGltcGxlbWVudG9yIHdpdGhv
dXQgbmVlZGluZyB0byBjaGVjayBmb3IgcmV0LmVycm9yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgbGliL3Jpc2N2
L2FzbS9zYmkuaCB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgbGliL3Jp
c2N2L3NiaS5jICAgICB8IDEwICsrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L2FzbS9zYmkuaCBiL2xpYi9y
aXNjdi9hc20vc2JpLmgKPj4gaW5kZXggMTk3Mjg4YzcuLjA2YmNlYzE2IDEwMDY0NAo+PiAtLS0g
YS9saWIvcmlzY3YvYXNtL3NiaS5oCj4+ICsrKyBiL2xpYi9yaXNjdi9hc20vc2JpLmgKPj4gQEAg
LTE4LDYgKzE4LDE5IEBACj4+ICAjZGVmaW5lIFNCSV9FUlJfSU8JCQktMTMKPj4gICNkZWZpbmUg
U0JJX0VSUl9ERU5JRURfTE9DS0VECQktMTQKPj4gIAo+PiArI2RlZmluZSBTQklfSU1QTF9CQkwJ
CTAKPj4gKyNkZWZpbmUgU0JJX0lNUExfT1BFTlNCSQkxCj4+ICsjZGVmaW5lIFNCSV9JTVBMX1hW
SVNPUgkJMgo+PiArI2RlZmluZSBTQklfSU1QTF9LVk0JCTMKPj4gKyNkZWZpbmUgU0JJX0lNUExf
UlVTVFNCSQk0Cj4+ICsjZGVmaW5lIFNCSV9JTVBMX0RJT1NJWAkJNQo+PiArI2RlZmluZSBTQklf
SU1QTF9DT0ZGRVIJCTYKPj4gKyNkZWZpbmUgU0JJX0lNUExfWEVOIFByb2plY3QJNwo+IAo+IHMv
UHJvamVjdC8vCj4gCj4+ICsjZGVmaW5lIFNCSV9JTVBMX1BPTEFSRklSRV9IU1MJOAo+PiArI2Rl
ZmluZSBTQklfSU1QTF9DT1JFQk9PVAk5Cj4+ICsjZGVmaW5lIFNCSV9JTVBMX09SRUJPT1QJMTAK
Pj4gKyNkZWZpbmUgU0JJX0lNUExfQkhZVkUJCTExCj4+ICsKPj4gIC8qIFNCSSBzcGVjIHZlcnNp
b24gZmllbGRzICovCj4+ICAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKPj4g
ICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAo+PiBAQCAtMTIzLDYgKzEz
NiwxMCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgc2JpX21rX3ZlcnNpb24odW5zaWdu
ZWQgbG9uZyBtYWpvciwgdW5zaWduZWQgbG9uZyBtaQo+PiAgCQl8IChtaW5vciAmIFNCSV9TUEVD
X1ZFUlNJT05fTUlOT1JfTUFTSyk7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBzYmlfaW1wbF9vcGVuc2JpX21rX3ZlcnNpb24odW5zaWduZWQgbG9uZyBtYWpvciwg
dW5zaWduZWQgbG9uZyBtaW5vcikKPj4gK3sKPj4gKwlyZXR1cm4gKChtYWpvciA8PCAxNikgfCAo
bWlub3IpKTsKPiAKPiBTaG91bGQgYXQgbGVhc3QgbWFzayBtaW5vciwgYmVzdCB0byBtYXNrIGJv
dGguCj4gCj4+ICt9Cj4+ICAKPj4gIHN0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGlu
dCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwKPj4gIAkJCXVuc2lnbmVkIGxvbmcgYXJnMSwgdW5z
aWduZWQgbG9uZyBhcmcyLAo+PiBAQCAtMTM5LDcgKzE1NiwyMCBAQCBzdHJ1Y3Qgc2JpcmV0IHNi
aV9zZW5kX2lwaV9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzayk7Cj4+ICBzdHJ1Y3Qgc2Jp
cmV0IHNiaV9zZW5kX2lwaV9icm9hZGNhc3Qodm9pZCk7Cj4+ICBzdHJ1Y3Qgc2JpcmV0IHNiaV9z
ZXRfdGltZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSk7Cj4+ICBzdHJ1Y3Qgc2JpcmV0IHNi
aV9nZXRfc3BlY192ZXJzaW9uKHZvaWQpOwo+PiArc3RydWN0IHNiaXJldCBzYmlfZ2V0X2ltcF92
ZXJzaW9uKHZvaWQpOwo+PiArc3RydWN0IHNiaXJldCBzYmlfZ2V0X2ltcF9pZCh2b2lkKTsKPj4g
IGxvbmcgc2JpX3Byb2JlKGludCBleHQpOwo+PiAgCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgc2Jp
X2NoZWNrX2ltcGwodW5zaWduZWQgbG9uZyBpbXBsKQo+PiArewo+PiArCXN0cnVjdCBzYmlyZXQg
cmV0Owo+PiArCj4+ICsJcmV0ID0gc2JpX2dldF9pbXBfaWQoKTsKPj4gKwlpZiAocmV0LmVycm9y
KQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlyZXR1cm4gcmV0LnZhbHVlID09IGltcGw7
Cj4gCj4gT3IsIG1vcmUgdGVyc2VseSwKPiAKPiBzdHJ1Y3Qgc2JpcmV0IHJldCA9IHNiaV9nZXRf
aW1wX2lkKCk7Cj4gcmV0dXJuICFyZXQuZXJyb3IgJiYgcmV0LnZhbHVlID09IGltcGw7Cj4gCj4g
YnV0IGFuIGFzc2VydCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UsIHNpbmNlIGdldC1pbXBsLWlkIHJl
YWxseSBzaG91bGRuJ3QKPiBmYWlsLCB1bmxlc3MgdGhlIFNCSSB2ZXJzaW9uIGlzIDAuMSwgd2hp
Y2ggd2UgZG9uJ3Qgc3VwcG9ydC4KPiAKPj4gK30KPj4gKwo+PiAgI2VuZGlmIC8qICFfX0FTU0VN
QkxFUl9fICovCj4+ICAjZW5kaWYgLyogX0FTTVJJU0NWX1NCSV9IXyAqLwo+PiBkaWZmIC0tZ2l0
IGEvbGliL3Jpc2N2L3NiaS5jIGIvbGliL3Jpc2N2L3NiaS5jCj4+IGluZGV4IDNjMzk1Y2ZmLi45
Y2I1NzU3ZSAxMDA2NDQKPj4gLS0tIGEvbGliL3Jpc2N2L3NiaS5jCj4+ICsrKyBiL2xpYi9yaXNj
di9zYmkuYwo+PiBAQCAtMTA3LDYgKzEwNywxNiBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZXRfdGlt
ZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSkKPj4gIAlyZXR1cm4gc2JpX2VjYWxsKFNCSV9F
WFRfVElNRSwgU0JJX0VYVF9USU1FX1NFVF9USU1FUiwgc3RpbWVfdmFsdWUsIDAsIDAsIDAsIDAs
IDApOwo+PiAgfQo+PiAgCj4+ICtzdHJ1Y3Qgc2JpcmV0IHNiaV9nZXRfaW1wX3ZlcnNpb24odm9p
ZCkKPj4gK3sKPj4gKwlyZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRfQkFTRSwgU0JJX0VYVF9CQVNF
X0dFVF9JTVBfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7Cj4+ICt9Cj4+ICsKPj4gK3N0cnVj
dCBzYmlyZXQgc2JpX2dldF9pbXBfaWQodm9pZCkKPj4gK3sKPj4gKwlyZXR1cm4gc2JpX2VjYWxs
KFNCSV9FWFRfQkFTRSwgU0JJX0VYVF9CQVNFX0dFVF9JTVBfSUQsIDAsIDAsIDAsIDAsIDAsIDAp
Owo+PiArfQo+IAo+IEdvaW5nIHdpdGggZXJyb3IgYXNzZXJ0cywgdGhlbiB3ZSBjYW4ganVzdCBw
dXQgdGhlIGFzc2VydHMgaW4gdGhlc2UKPiBmdW5jdGlvbnMgYW5kIHJldHVybiByZXQudmFsdWUg
ZGlyZWN0bHksIGxpa2Ugc2JpX3Byb2JlKCkgZG9lcywgd2hpY2gKPiBtZWFucyBzYmlfY2hlY2tf
aW1wbCgpIGNhbiBiZSBkcm9wcGVkLgoKQWNrLCBJJ2xsIG1vZGlmeSB0aGF0LgoKVGhhbmtzLAoK
Q2zDqW1lbnQKCj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPj4gKwo+PiAgc3RydWN0IHNiaXJldCBz
YmlfZ2V0X3NwZWNfdmVyc2lvbih2b2lkKQo+PiAgewo+PiAgCXJldHVybiBzYmlfZWNhbGwoU0JJ
X0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfR0VUX1NQRUNfVkVSU0lPTiwgMCwgMCwgMCwgMCwgMCwg
MCk7Cj4+IC0tIAo+PiAyLjQ3LjIKPj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
