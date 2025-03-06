Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D8C282D1
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 15:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7vSLVMAITJg71ZM8CPy/npZTlQoqvMytowm6gN6oDw=; b=v7/CZYa8DIs/92
	XpdhLEExA9Sm4lLRr1psRPvHZPAsK8iA2DJsIx1E4tdABVWZlvwGwaWBTO9ARfQdySVZ5wxkDYv2z
	hXB+GLa+9dnQsBNAg/hmi7C3WsSes6IoLq4TMKWv9hk+ko7kGwaTQxoF9Cup5TbLzQ5eDaOVps3mX
	6aoMEC5kkoVnSP4Qw40bzSQe3Di8nuHusZGjlTTiD5KUsCgjKq9SOle/+ycEMvnxHj4I80ZWn4zwH
	Mo9ccB7iZ6mKVZV6taZ/b/9DI7I7yq3FMkjlWS/7sO/R97nOCRoEFnclHkH4wWeYGt4cg75ySbQke
	ghxKUiK5yeF8uxMsRqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCzb-0000000BIMK-12Yf;
	Thu, 06 Mar 2025 15:18:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCzY-0000000BILk-1GpP
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 15:18:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f406e9f80so642903f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Mar 2025 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741274310; x=1741879110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIXC/E5OlKrDuk9g0mFflx2OTFt9jKupk5/WwhMtXpU=;
        b=IdbpgVk4X0UiKOmGqMEkwOJg0/gHQcDxZeYVtfTJIZUjQX8tnrW1b0USwekO4cYaxh
         MTWrnjuH7glgQRcqjj8556ywmOJjMDIk0eg8Z7sZx1QkByKHVM+icLMrnpkiLe04CxjV
         M5w0lZC6sLHXqhsgjn1tC4lnVokLtwoA3TydezsVxSU13Ho+H8AX94Rwc5cWrLB5fYqr
         e/nRDlzJY1BFrDBx3PjU+cdgqWhOLqOD7bWisu2pCIDhLiFNY9IB9nNXix4cSz1uIafy
         6pZsK+WFcEHubGn0ZHsjzbnI2GDJYCI2Xsr0Pih7bjEEX+7xUNxlAzDfMv3Av3lbwVap
         OvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274310; x=1741879110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIXC/E5OlKrDuk9g0mFflx2OTFt9jKupk5/WwhMtXpU=;
        b=X0U5IwTNvBV0rVByRiDQhQmF1h776Q+yxBneA0XWtwo3J5g/k3lUS3IXB/jbCLVOH5
         q9VqR8sVN+rIzmM4LOzRwwp6kdLkeBkEWZuoHlCiPRCEBzXDe14II1n+Sc3HSgkNE74z
         58GlRXPZzQbwgUJPG4EXXiDeExoyrYtlV2GnMDwV9QJQ2FSVvQz4g/f/EybKWPbHnB4G
         jSqW67UaI8W8VlyGd9rq8fUMEr0YJrxR3eU5meHieB2G4Z4eu/QAO5+lSEmwcdsRyaAu
         eZKHTZOccrIC46OSwsMeo86b7A2NQnCZ9Sk+kJ/s9PfXTnkVoy7l9fYA5jmIHY+wRlJ0
         CyAA==
X-Forwarded-Encrypted: i=1; AJvYcCUnmUSu/klm3mZtL5xxKXRH6yGGP1uXx63ePuBw4QZlD5OvCfrTMJtyvh1ZYcVa581smFBmgujO5+I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt5qIlK+SLec7PI4PuTXQq5sLWH45ayTc42ANM97Je+1CzXZ3l
	zJnIW6mnh8qe+c2qMTs+w/QYcxudcIor9QKpEFmPitoF+7nBa4fTQqCSy+OoWyE=
X-Gm-Gg: ASbGncuIDVSNvyN65UqR4SpGE+SQuSfZfdVz/GSe6fOVSvoR/wTzdTf9DAJEesZIHPN
	CLGKglM9FkH5scVOPDdjiXyQywGTsBv4luijH1ctj7qbVsAVt8bBc/kBpL/+eJ+WRNABOkKm5iP
	puDrmP9qs1zz4e36kZoaTDs7/xRF4FRfYtCbG5zxlUwThIJBLUWJ5UADlI0k33dGwSzRl0VJaSN
	4gFjp/0kMsppcxP5a/RQVNj4OChoLELh3KpxQ0aZSHYFc8iyPykEsxtnEGQX8r2+m/soIFZpI/M
	X04b6Oq5oxhz1sPGkIE/HCKGZZIQVvUtioKIcGMORtIOUFFM2oWgdm1wXgI5Hi2RrcmdmSvZUrL
	Kmy35lgiKk5BwSQ==
X-Google-Smtp-Source: AGHT+IFCi0fjVLMkviMnUgPgVJ0nwO5mlZi4c0s50RoU2djU+cKhatevNgFUGeCsxJR3YwcKPVFt0A==
X-Received: by 2002:a5d:47ce:0:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-3911f72769cmr5208010f8f.5.1741274310512;
        Thu, 06 Mar 2025 07:18:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0193bfsm2348419f8f.55.2025.03.06.07.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 07:18:30 -0800 (PST)
Message-ID: <95a72c57-40ff-417a-a8a2-065554eda5ec@rivosinc.com>
Date: Thu, 6 Mar 2025 16:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v7 6/6] riscv: sbi: Add SSE extension tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
 <20250214114423.1071621-7-cleger@rivosinc.com>
 <20250227-93a15f012d9bda941ef44e38@orel>
 <d37dc38b-ba6d-48cd-8d23-9e2ce9c6581e@rivosinc.com>
 <20250306-5f8b0b45873648fa93beccc7@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250306-5f8b0b45873648fa93beccc7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_071832_344071_5A074069 
X-CRM114-Status: GOOD (  19.52  )
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

CgpPbiAwNi8wMy8yMDI1IDE2OjE1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBNYXIg
MDYsIDIwMjUgYXQgMDM6MzI6MzlQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyOC8wMi8yMDI1IDE4OjUxLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gLi4uCj4+Pj4g
KwlhdHRyID0gU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTOwo+Pj4+ICsJcmV0ID0gc2Jp
X3NzZV9yZWFkX2F0dHJzKGV2ZW50X2lkLCBhdHRyLCAxLCAmcHJldl92YWx1ZSk7Cj4+Pj4gKwlz
YmlyZXRfcmVwb3J0X2Vycm9yKCZyZXQsIFNCSV9TVUNDRVNTLCAiU2F2ZSBpbnRlcnJ1cHRlZCBm
bGFncyBubyBlcnJvciIpOwo+Pj4+ICsKPj4+PiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGludGVycnVwdGVkX2ZsYWdzKTsgaSsrKSB7Cj4+Pj4gKwkJZmxhZ3MgPSBpbnRlcnJ1cHRlZF9m
bGFnc1tpXTsKPj4+PiArCQlyZXQgPSBzYmlfc3NlX3dyaXRlX2F0dHJzKGV2ZW50X2lkLCBhdHRy
LCAxLCAmZmxhZ3MpOwo+Pj4+ICsJCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX1NVQ0NF
U1MsCj4+Pj4gKwkJCQkgICAgIlNldCBpbnRlcnJ1cHRlZCBmbGFncyBiaXQgMHglbHggdmFsdWUg
bm8gZXJyb3IiLCBmbGFncyk7Cj4+Pj4gKwkJcmV0ID0gc2JpX3NzZV9yZWFkX2F0dHJzKGV2ZW50
X2lkLCBhdHRyLCAxLCAmdmFsdWUpOwo+Pj4+ICsJCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwg
U0JJX1NVQ0NFU1MsICJHZXQgaW50ZXJydXB0ZWQgZmxhZ3MgYWZ0ZXIgc2V0IG5vIGVycm9yIik7
Cj4+Pj4gKwkJcmVwb3J0KHZhbHVlID09IGZsYWdzLCAiaW50ZXJydXB0ZWQgZmxhZ3MgbW9kaWZp
ZWQgdmFsdWUgb2s6IDB4JWx4IiwgdmFsdWUpOwo+Pj4KPj4+IERvIHdlIGFsc28gbmVlZCB0byB0
ZXN0IHdpdGggbW9yZSB0aGFuIG9uZSBmbGFnIHNldCBhdCBhIHRpbWU/Cj4+Cj4+IFRoYXQgaXMg
YWxyZWFkeSBkb25lIGEgZmV3IGxpbmVzIGFib3ZlIChzZWUgLyogUmVzdG9yZSBmdWxsIHNhdmVk
IHN0YXRlICovKS4KPiAKPiBPSwo+IAo+Pgo+Pj4KPj4+PiArCX0KPj4+PiArCj4+Pj4gKwkvKiBX
cml0ZSBpbnZhbGlkIGJpdCBpbiBmbGFnIHJlZ2lzdGVyICovCj4+Pj4gKwlmbGFncyA9IFNCSV9T
U0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NEVCA8PCAxOwo+Pj4+ICsJcmV0ID0g
c2JpX3NzZV93cml0ZV9hdHRycyhldmVudF9pZCwgYXR0ciwgMSwgJmZsYWdzKTsKPj4+PiArCXNi
aXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX0VSUl9JTlZBTElEX1BBUkFNLCAiU2V0IGludmFs
aWQgZmxhZ3MgYml0IDB4JWx4IHZhbHVlIGVycm9yIiwKPj4+PiArCQkJICAgIGZsYWdzKTsKPj4+
PiArI2lmIF9fcmlzY3ZfeGxlbiA+IDMyCj4+Pj4gKwlmbGFncyA9IEJJVCgzMik7Cj4+Pj4gKwly
ZXQgPSBzYmlfc3NlX3dyaXRlX2F0dHJzKGV2ZW50X2lkLCBhdHRyLCAxLCAmZmxhZ3MpOwo+Pj4+
ICsJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sICJTZXQg
aW52YWxpZCBmbGFncyBiaXQgMHglbHggdmFsdWUgZXJyb3IiLAo+Pj4KPj4+IFRoaXMgc2hvdWxk
IGhhdmUgYSBkaWZmZXJlbnQgcmVwb3J0IHN0cmluZyB0aGFuIHRoZSB0ZXN0IGFib3ZlLgo+Pgo+
PiBUaGUgYml0IHZhbHVlIGZvcm1hdCBkb2VzIGRpZmZlcmVudGlhdGUgdGhlIHByaW50ZiB0aG91
Z2guCj4gCj4gT0sKPiAKPiAuLi4KPj4+PiArCXJldCA9IHNiaV9zc2VfdW5yZWdpc3RlcihldmVu
dF9pZCk7Cj4+Pj4gKwlpZiAoIXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX1NVQ0NFU1Ms
ICJTU0UgdW5yZWdpc3RlciBubyBlcnJvciIpKQo+Pj4+ICsJCWdvdG8gZG9uZTsKPj4+PiArCj4+
Pj4gKwlzc2VfY2hlY2tfc3RhdGUoZXZlbnRfaWQsIFNCSV9TU0VfU1RBVEVfVU5VU0VEKTsKPj4+
PiArCj4+Pj4gK2RvbmU6Cj4+Pgo+Pj4gSXMgaXQgb2sgdG8gbGVhdmUgdGhpcyBmdW5jdGlvbiB3
aXRoIGFuIGV2ZW50IHJlZ2lzdGVyZWQvZW5hYmxlZD8gSWYgbm90LAo+Pj4gdGhlbiBzb21lIG9m
IHRoZSBnb3RvJ3MgYWJvdmUgc2hvdWxkIGdvdG8gb3RoZXIgbGFiZWxzIHdoaWNoIGRpc2FibGUg
YW5kCj4+PiB1bnJlZ2lzdGVyLgo+Pgo+PiBObyBpdCdzIG5vdCBidXQgaXQncyBtYXNzaXZlIHBh
aW4gdG8ga2VlcCBldmVyeXRoaW5nIGNvaGVyZW50IHdoZW4gaXQKPj4gZmFpbHMgOykKPj4KPiAK
PiBhc3NlcnRzL2Fib3J0cyBhcmUgZmluZSBpZiB3ZSBjYW4ndCByZWNvdmVyIGVhc2lseSwgYnV0
IHRoZW4gd2Ugc2hvdWxkCj4gbW92ZSB0aGUgU1NFIHRlc3RzIG91dCBvZiB0aGUgbWFpbiBTQkkg
dGVzdCBpbnRvIGl0cyBvd24gdGVzdCBzbyB3ZQo+IGRvbid0IHNob3J0LWNpcmN1aXQgYWxsIG90
aGVyIHRlc3RzIHRoYXQgbWF5IGZvbGxvdyBpdC4KCk9oIHllcyBJIGRpZCBub3QgdGhvdWdoIG9m
IHRoYXQuIEkgY291bGQgYXMgd2VsbCBzaG9ydCBjaXJjdWl0IHRoZSBzc2UKZXZlbnQgdGVzdCB0
aGVtc2VsdmVzLiBDdXJyZW50bHkgdGVzdCBmdW5jdGlvbiByZXR1cm5zIHZvaWQgYnV0IHRoYXQK
Y291bGQgYmUgaGFuZGxlZCBtb3JlIGdyYWNlZnVsbHkgc28gdGhhdCB3ZSBkb24ndCBicmVhayBh
bGwgb3RoZXIgdGVzdHMKYXMgd2VsbC4KCj4gCj4gLi4uCj4+Pj4gKwkJLyogQmUgc3VyZSBnbG9i
YWwgZXZlbnRzIGFyZSB0YXJnZXRpbmcgdGhlIGN1cnJlbnQgaGFydCAqLwo+Pj4+ICsJCXNzZV9n
bG9iYWxfZXZlbnRfc2V0X2N1cnJlbnRfaGFydChldmVudF9pZCk7Cj4+Pj4gKwo+Pj4+ICsJCXNi
aV9zc2VfcmVnaXN0ZXIoZXZlbnRfaWQsIGV2ZW50X2FyZyk7Cj4+Pj4gKwkJdmFsdWUgPSBhcmct
PnByaW87Cj4+Pj4gKwkJc2JpX3NzZV93cml0ZV9hdHRycyhldmVudF9pZCwgU0JJX1NTRV9BVFRS
X1BSSU9SSVRZLCAxLCAmdmFsdWUpOwo+Pj4+ICsJCXNiaV9zc2VfZW5hYmxlKGV2ZW50X2lkKTsK
Pj4+Cj4+PiBObyByZXR1cm4gY29kZSBjaGVja3MgZm9yIHRoZXNlIFNTRSBjYWxscz8gSWYgd2Un
cmUgOTklIHN1cmUgdGhleSBzaG91bGQKPj4+IHN1Y2NlZWQsIHRoZW4gSSdkIHN0aWxsIGNoZWNr
IHRoZW0gd2l0aCBhc3NlcnRzLgo+Pgo+PiBJIHdhcyBhIGJpdCBsYXp5IGhlcmUuIFNpbmNlIHRo
ZSBnb2FsIGlzICpub3QqIHRvIGNoZWNrIHRoZSBldmVudCBzdGF0ZQo+PiB0aGVtc2VsdmUgYnV0
IHJhdGhlciB0aGUgb3JkZXJpbmcsIEkgZGlkbid0IGJvdGhlciBjaGVja2luZyB0aGVtLiBBcwo+
PiBzYWlkIGJlZm9yZSwgaGFibmRsaW5nIGVycm9yIGFuZCBldmVudCBzdGF0ZSBwcm9wZXJseSBp
biBjYXNlIG9mIGVycm9yCj4+IHNlZW1lZCBsaWtlIGEgY2h1cm4gdG8gbWUgKmp1c3QqIGZvciB0
ZXN0aW5nLiBJJ2xsIHRyeSBzb21ldGhpbmcgYmV0dGVyCj4+IGFzIHdlbGwgdGhvdWdoLgo+Pgo+
IAo+IFdlIGFsd2F5cyB3YW50IGF0IGxlYXN0IGFzc2VydHMoKSBpbiBvcmRlciB0byBjYXRjaCB0
aGUgdHJhaW4gd2hlbiBpdAo+IGZpcnN0IGdvZXMgb2ZmIHRoZSByYWlscywgcmF0aGVyIHRoYW4g
YWZ0ZXIgaXQgc21hc2hlZCB0aHJvdWdoIGEgdmlsbGFnZQo+IG9yIHR3by4KClllYWggc3VyZSA7
KSBJJ2xsIHRyeSB0byBkbyB3aGF0IEkgc2FpZCBiZWZvcmU6IHNob3J0IGNpcmN1aXQgdGhlCnJl
bWFpbmluZyBTU0UgdGVzdCBmb3IgdGhlIGV2ZW50IGl0c2VsZiByYXRoZXIgdGhhbiBhYm9ydGlu
ZyBvcgpzcGxpdHRpbmcgdGhlIHRlc3RzLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtz
LAo+IGRyZXcKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
