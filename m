Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A11C36007
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07CVunCiDvil/lsdLG6mQJmREWeDa91SRuiay37uPwU=; b=NK+W7WPFcT3SIL
	XMEDOaAeXyRq9q6V2dkXuzSiCHAycDLDkhZMijWj7vAIbcdHQAhVSZ/JD+Zorz4UWXRhgszVRCBAY
	kvlcT7i2HQWxyCmvOp8tQFo+S+43d1CXP9HncDf8AJXWi35SLic4jdTiLwrAi1JtTFOqnE6Y3MCEu
	/ZAlMXIeIF/znBxKtCT3iocPUqIwQAlYTjhtPKWrv4tZ76G350D44tH4YnYXoiNK2Aby4nO+8SHRW
	7lZ2X4e+ZTeGcd2SDYbNzx75UMxoSdEcn8mkvEujdk5Kl0UvRD8HO7/YcwRBtSYiPTx5Cj5BwtEtt
	dzzNA+yg0fKA2nke+vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz5-0000000GAPa-3294;
	Fri, 21 Mar 2025 20:28:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tviso-0000000G9Yz-0Fzp
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:22:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so11709775e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Mar 2025 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742588540; x=1743193340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lzd4xG+2SwOBDBgUcXXvZKQ1fVJHEBo+Bv/RqZ5W6kU=;
        b=efwdmrMgRurF3oCqj9Ka4M2q2AG1SESpRRJuFufGPn28BmaLh8t9v2hFXBqHWLos9e
         o41ujGmQ/ItU3Ung2Hc4qv/k3FPzM5uxtK2PJaXMfVOESftACXJ6U/M43WOBVytqsMFS
         SFTajVIKFCCd2C0FK+C4SlyimNbQedGyNvq+THADa61uZA+K4GeNEyab54ZICZ+nBZsH
         n5/8bJtz/tBaRG+ncyjFa/KS7u8aoy+VCYCNYXb7KHJNhWUpCGbxMCVvoX/m6C+/Bz23
         p/mkRe+p+5TrC6dFfWGptoeu5R45uvmnrY0v6/tsrGNEZEaiElum6ELVkOTrJYJYsZa4
         ygrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742588540; x=1743193340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzd4xG+2SwOBDBgUcXXvZKQ1fVJHEBo+Bv/RqZ5W6kU=;
        b=Sy0vpGlh1aa+FtTTZ10fvWkfAx+NOnGQuUmblwSFzVGEQYzwLZpML3ZftAFxgfNfjK
         SnmSC8zS+UzSW0cjbmZVUa/Gi6OiP1INf+/oCTsc2ck/9MBP20BYKwYNdmwig9kB3oCc
         6+Rql0l35cx+Wv+d2F/5Cxxp92UT02bS3xr5wcemNNOOmy9j+DOJ04zjVDbNNjHEl9+s
         Auig/kAUROjg6sQ4dRk5/kIGRY7/tBCBCCsbGzzLmbeU7kPkN9H9xrVMeStpZd/CmMVp
         YhJlNCjLZKnvF+0aU9nbEIQfZezhF90Hsq5mWR6emr5hDXIcoK7BSfHRdMMY/SQZE81b
         aGtA==
X-Forwarded-Encrypted: i=1; AJvYcCWQVTtR5vDVQxFzZxRAVn3QoixbVv0izTDiYsMACjosbDtb7GJcGajHKUN6td25mmBMskR9o1GjXS0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyfRDQH82pycwZQEF4aRN6EHN65FCcDkgkwhpSMSesQKKfDgh9
	V/H7lO7IN79x34MKEOGFi4WayRFYLkWBBmY9p5/T6NBdcQdoLbyiCGRgGVzBKfE=
X-Gm-Gg: ASbGncvEOa7I+PPy0kaC56ceSeEtjDl1DBCpioghZ5uNPEMl/78EpfaTYGS87OJ/2QR
	H9ipkZnvCbsrwUCArjKnH0kXAu4AJ/BtdbO1LDq9KoKVw74TMJhivKCZINt4wXnkmO/Eagf01mt
	U1fMGDynQus/MuesIFxiLMgCywQg/+pcdHwpM77JGOtn/wnEyDzzOusaQ0eduIt9dqExYaMQbgo
	7CgXBNUyfU2KvQL+pchNShJ1Sc5ea3ZHysX6sGHG7AHUaaS31qrbC59Pg1C72nsi/xhQqpjuD4w
	abu1SaKZdXOyBeiFFn7RDIiPbm6rf7di68xRkCHN0oim29Rel0CpG2BY9jWSqgDxTrC47G7OQl4
	9afy0L3+Crx0IxMWmWGuIaoBn
X-Google-Smtp-Source: AGHT+IFMDdsZ0mN9HV7XN3ROBaSzzyRHTn5AWR0glOM3qL5vAkyivsz/PmDNRERlqpzG7S9gLmtOaw==
X-Received: by 2002:a05:600c:1548:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43d509f73admr46812415e9.14.1742588540177;
        Fri, 21 Mar 2025 13:22:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6544sm3302589f8f.68.2025.03.21.13.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:22:19 -0700 (PDT)
Message-ID: <dba5ed81-6557-45aa-8246-0c9e6d6c18a0@rivosinc.com>
Date: Fri, 21 Mar 2025 21:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 3/3] riscv: sbi: Use kfail for known
 opensbi failures
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: atishp@rivosinc.com, akshaybehl231@gmail.com
References: <20250321165403.57859-5-andrew.jones@linux.dev>
 <20250321165403.57859-8-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250321165403.57859-8-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_132222_101874_488D20FA 
X-CRM114-Status: GOOD (  16.92  )
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

CgpPbiAyMS8wMy8yMDI1IDE3OjU0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVXNlIGtmYWlsIGZv
ciB0aGUgb3BlbnNiaSBzL1NCSV9FUlJfREVOSUVEL1NCSV9FUlJfREVOSUVEX0xPQ0tFRC8KPiBj
aGFuZ2UuIFdlIGV4cGVjdCBpdCB0byBiZSBmaXhlZCBpbiAxLjcsIHNvIG9ubHkga2ZhaWwgZm9y
IG9wZW5zYmkKPiB3aGljaCBoYXMgYSB2ZXJzaW9uIGxlc3MgdGhhbiB0aGF0LiBBbHNvIGNoYW5n
ZSB0aGUgb3RoZXIgdXNlcyBvZgo+IGtmYWlsIHRvIG9ubHkga2ZhaWwgZm9yIG9wZW5zYmkgdmVy
c2lvbnMgbGVzcyB0aGFuIDEuNy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0BsaW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS1md2Z0LmMgfCAyMCArKysr
KysrKysrKysrLS0tLS0tLQo+ICByaXNjdi9zYmkuYyAgICAgIHwgIDYgKysrKy0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcmlzY3Yvc2JpLWZ3ZnQuYyBiL3Jpc2N2L3NiaS1md2Z0LmMKPiBpbmRleCAzZDIyNTk5
N2MwZWMuLmM1MmZiZDZlNzdhNiAxMDA2NDQKPiAtLS0gYS9yaXNjdi9zYmktZndmdC5jCj4gKysr
IGIvcmlzY3Yvc2JpLWZ3ZnQuYwo+IEBAIC04MywxOSArODMsMjEgQEAgc3RhdGljIHZvaWQgZndm
dF9mZWF0dXJlX2xvY2tfdGVzdF92YWx1ZXModWludDMyX3QgZmVhdHVyZSwgc2l6ZV90IG5yX3Zh
bHVlcywKPiAgCj4gIAlyZXBvcnRfcHJlZml4X3B1c2goImxvY2tlZCIpOwo+ICAKPiArCWJvb2wg
a2ZhaWwgPSBfX3NiaV9nZXRfaW1wX2lkKCkgPT0gU0JJX0lNUExfT1BFTlNCSSAmJgo+ICsJCSAg
ICAgX19zYmlfZ2V0X2ltcF92ZXJzaW9uKCkgPCBzYmlfaW1wbF9vcGVuc2JpX21rX3ZlcnNpb24o
MSwgNyk7Cj4gKwo+ICAJZm9yIChpbnQgaSA9IDA7IGkgPCBucl92YWx1ZXM7ICsraSkgewo+ICAJ
CXJldCA9IGZ3ZnRfc2V0KGZlYXR1cmUsIHRlc3RfdmFsdWVzW2ldLCAwKTsKPiAtCQlzYmlyZXRf
cmVwb3J0X2Vycm9yKCZyZXQsIFNCSV9FUlJfREVOSUVEX0xPQ0tFRCwKPiAtCQkJIlNldCB0byAl
bHUgd2l0aG91dCBsb2NrIGZsYWciLCB0ZXN0X3ZhbHVlc1tpXSk7Cj4gKwkJc2JpcmV0X2tmYWls
X2Vycm9yKGtmYWlsLCAmcmV0LCBTQklfRVJSX0RFTklFRF9MT0NLRUQsCj4gKwkJCQkgICAiU2V0
IHRvICVsdSB3aXRob3V0IGxvY2sgZmxhZyIsIHRlc3RfdmFsdWVzW2ldKTsKPiAgCj4gIAkJcmV0
ID0gZndmdF9zZXQoZmVhdHVyZSwgdGVzdF92YWx1ZXNbaV0sIFNCSV9GV0ZUX1NFVF9GTEFHX0xP
Q0spOwo+IC0JCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX0VSUl9ERU5JRURfTE9DS0VE
LAo+IC0JCQkiU2V0IHRvICVsdSB3aXRoIGxvY2sgZmxhZyIsIHRlc3RfdmFsdWVzW2ldKTsKPiAr
CQlzYmlyZXRfa2ZhaWxfZXJyb3Ioa2ZhaWwsICZyZXQsIFNCSV9FUlJfREVOSUVEX0xPQ0tFRCwK
PiArCQkJCSAgICJTZXQgdG8gJWx1IHdpdGggbG9jayBmbGFnIiwgdGVzdF92YWx1ZXNbaV0pOwo+
ICAJfQo+ICAKPiAgCXJldCA9IGZ3ZnRfZ2V0KGZlYXR1cmUpOwo+IC0Jc2JpcmV0X3JlcG9ydCgm
cmV0LCBTQklfU1VDQ0VTUywgbG9ja2VkX3ZhbHVlLAo+IC0JCSJHZXQgdmFsdWUgJWx1IiwgbG9j
a2VkX3ZhbHVlKTsKPiArCXNiaXJldF9yZXBvcnQoJnJldCwgU0JJX1NVQ0NFU1MsIGxvY2tlZF92
YWx1ZSwgIkdldCB2YWx1ZSAlbHUiLCBsb2NrZWRfdmFsdWUpOwoKUmVmb3JtYXR0aW5nID8KCj4g
IAo+ICAJcmVwb3J0X3ByZWZpeF9wb3AoKTsKPiAgfQo+IEBAIC0xMDMsNiArMTA1LDcgQEAgc3Rh
dGljIHZvaWQgZndmdF9mZWF0dXJlX2xvY2tfdGVzdF92YWx1ZXModWludDMyX3QgZmVhdHVyZSwg
c2l6ZV90IG5yX3ZhbHVlcywKPiAgc3RhdGljIHZvaWQgZndmdF9mZWF0dXJlX2xvY2tfdGVzdCh1
aW50MzJfdCBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIGxvY2tlZF92YWx1ZSkKPiAgewo+ICAJdW5z
aWduZWQgbG9uZyB2YWx1ZXNbXSA9IHswLCAxfTsKPiArCgpUaGF0J3Mgc29tZSBzcHVyaW91cyBu
ZXdsaW5lIGhlcmUuCgoKPiAgCWZ3ZnRfZmVhdHVyZV9sb2NrX3Rlc3RfdmFsdWVzKGZlYXR1cmUs
IDIsIHZhbHVlcywgbG9ja2VkX3ZhbHVlKTsKPiAgfQo+ICAKPiBAQCAtMzE3LDcgKzMyMCwxMCBA
QCBzdGF0aWMgdm9pZCBmd2Z0X2NoZWNrX3B0ZV9hZF9od191cGRhdGluZyh2b2lkKQo+ICAJcmVw
b3J0KHJldC52YWx1ZSA9PSAwIHx8IHJldC52YWx1ZSA9PSAxLCAiZmlyc3QgZ2V0IHZhbHVlIGlz
IDAvMSIpOwo+ICAKPiAgCWVuYWJsZWQgPSByZXQudmFsdWU7Cj4gLQlyZXBvcnRfa2ZhaWwodHJ1
ZSwgIWVuYWJsZWQsICJyZXNldHMgdG8gMCIpOwo+ICsKPiArCWJvb2wga2ZhaWwgPSBfX3NiaV9n
ZXRfaW1wX2lkKCkgPT0gU0JJX0lNUExfT1BFTlNCSSAmJgo+ICsJCSAgICAgX19zYmlfZ2V0X2lt
cF92ZXJzaW9uKCkgPCBzYmlfaW1wbF9vcGVuc2JpX21rX3ZlcnNpb24oMSwgNyk7Cj4gKwlyZXBv
cnRfa2ZhaWwoa2ZhaWwsICFlbmFibGVkLCAicmVzZXRzIHRvIDAiKTsKPiAgCj4gIAlpbnN0YWxs
X2V4Y2VwdGlvbl9oYW5kbGVyKEVYQ19MT0FEX1BBR0VfRkFVTFQsIGFkdWVfcmVhZF9oYW5kbGVy
KTsKPiAgCWluc3RhbGxfZXhjZXB0aW9uX2hhbmRsZXIoRVhDX1NUT1JFX1BBR0VfRkFVTFQsIGFk
dWVfd3JpdGVfaGFuZGxlcik7Cj4gZGlmZiAtLWdpdCBhL3Jpc2N2L3NiaS5jIGIvcmlzY3Yvc2Jp
LmMKPiBpbmRleCA4M2JjNTUxMjVkNDYuLmVkYjFhNmJlZjFhYyAxMDA2NDQKPiAtLS0gYS9yaXNj
di9zYmkuYwo+ICsrKyBiL3Jpc2N2L3NiaS5jCj4gQEAgLTUxNSwxMCArNTE1LDEyIEBAIGVuZF90
d286Cj4gIAlzYmlyZXRfcmVwb3J0X2Vycm9yKCZyZXQsIFNCSV9TVUNDRVNTLCAibm8gdGFyZ2V0
cywgaGFydF9tYXNrX2Jhc2UgaXMgMSIpOwo+ICAKPiAgCS8qIFRyeSB0aGUgbmV4dCBoaWdoZXIg
aGFydGlkIHRoYW4gdGhlIG1heCAqLwo+ICsJYm9vbCBrZmFpbCA9IF9fc2JpX2dldF9pbXBfaWQo
KSA9PSBTQklfSU1QTF9PUEVOU0JJICYmCj4gKwkJICAgICBfX3NiaV9nZXRfaW1wX3ZlcnNpb24o
KSA8IHNiaV9pbXBsX29wZW5zYmlfbWtfdmVyc2lvbigxLCA3KTsKPiAgCXJldCA9IHNiaV9zZW5k
X2lwaSgyLCBtYXhfaGFydGlkKTs+IC0JcmVwb3J0X2tmYWlsKHRydWUsIHJldC5lcnJvcgo9PSBT
QklfRVJSX0lOVkFMSURfUEFSQU0sICJoYXJ0X21hc2sgZ290IGV4cGVjdGVkIGVycm9yICglbGQp
IiwgcmV0LmVycm9yKTsKPiArCXNiaXJldF9rZmFpbF9lcnJvcihrZmFpbCwgJnJldCwgU0JJX0VS
Ul9JTlZBTElEX1BBUkFNLCAiaGFydF9tYXNrIik7Cj4gIAlyZXQgPSBzYmlfc2VuZF9pcGkoMSwg
bWF4X2hhcnRpZCArIDEpOwo+IC0JcmVwb3J0X2tmYWlsKHRydWUsIHJldC5lcnJvciA9PSBTQklf
RVJSX0lOVkFMSURfUEFSQU0sICJoYXJ0X21hc2tfYmFzZSBnb3QgZXhwZWN0ZWQgZXJyb3IgKCVs
ZCkiLCByZXQuZXJyb3IpOwo+ICsJc2JpcmV0X2tmYWlsX2Vycm9yKGtmYWlsLCAmcmV0LCBTQklf
RVJSX0lOVkFMSURfUEFSQU0sICJoYXJ0X21hc2tfYmFzZSIpOwo+ICAKPiAgCXJlcG9ydF9wcmVm
aXhfcG9wKCk7Cj4gIAoKSGkgQW5kcmV3LAoKSSB0cmllZCB0aGlua2luZyBvZiBzb21lIHdheSB0
byBmYWN0b3JpemUgdGhlIHZlcnNpb24gY2hlY2sgYnV0IGNhbid0CnJlYWxseSBmaW5kIHNvbWV0
aGluZyBlbGVnYW50LiBXaXRob3V0IHRoZSBzcHVyaW91cyBuZXdsaW5lOgoKUmV2aWV3ZWQtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
