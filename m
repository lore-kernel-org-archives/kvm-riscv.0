Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48D5C021B2
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JATMTMGQWCVcWglektO04WM4pRpiVac8MfCGR6j8QGE=; b=O70QRxjIz3hGbu
	qtJw8TS+31A2aBB9I/y4uaf88XIhPtgjXpIB2u9c2jGvxjnRolA34ixebqBpdMgeFhmsdgGvOhwgL
	kr++BYQHVRvD9jr76odnedP8lHQ8GVSxUkASfFGBD57NZ0iTC7VDOLtN0+z1aidqx4bFw3LeReJxB
	LQcYrM/04ZqtuxqdZVjPFdOJP1oSvgg9Upt8mB9sCRs5dZrUnGiYeagBaNWUh/Ddy9EDdu2s/gvB2
	tSC+yscDtMoZ6t8rrAP5fUupfk30KUlYiDDvG8HGOMCRWatkrceudQJ61KA3KJUj+zmrcR3+u6zjy
	fNWRo7GHSgFchvLNHXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy2r-00000000OT6-0ORS;
	Tue, 25 Feb 2025 16:44:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxAy-000000007Pg-2eYU
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 15:48:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2212a930001so45836475ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740498532; x=1741103332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsccQnrBt/HVKVRC76y+/X05SXbpgsZtc6uPmbR4+7s=;
        b=l3W4MK0G1w1DfBd2BvvG9gVizav4pjaREtDPwA1zz55zLjznCBb4yX0cAnvgqNqnES
         SwEapyxps0Fo/JkkbmcwsVYyhVCEPwpMU/C6OFGVlX97Jgu3pGN5iJRw8HR1xTX++Z9t
         j7POb0IMTs6/kE3Pc/GJSYZBoEnhNE7yaZyoi+v83BGXFjT4GR38Osir7giQt63hwF2n
         e2jQbap/5DyIlSNpityuobwDgJ2G3QDLy3RdUyt49ta6ZgONGHbukHn5ykkSRyA5aKWy
         XPi+sKtwfyghSFggdqUkqKKqBkzoCfL6XByNu6VcdDouZeE9aIlqKAZGo26MTMpItdeU
         wKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498532; x=1741103332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsccQnrBt/HVKVRC76y+/X05SXbpgsZtc6uPmbR4+7s=;
        b=cpaGEtci3Ywa3iSPrxyoClNBjFeAvQvXMs9MatDQ8E9Grd+St1Qfty3UUX8R/4sun6
         aePqIj5zdge3goVE4mcGt2c2nO97A0z/i1uKBGtFU5UF9BOu1Q1o7L0X8x0CdIVmUpks
         ZAC5MQKoylozDN+YDiIDcKDpOqI6y4qHarYdk+TdmWYVPYc5n3obQZtzD2CM5/IWiO0R
         xH+FqrLrFFJMwLPuDFFL3zQxf/W+4bN8wKuK7F5Ao/I7KMFsIlzarADJdx/T2OczqKvH
         oWDHZlmzA+GAXR9jl8dzxctuN4g4WGqeRFxlWWnXNQHqYsQm9DmZZ7iM9B+igknY8KSH
         LKoA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ9xlTS3op6TtFuWOkFlbCQqEURz6GUVOl4wHu2VCHKyDgybSP5sanV7CIBNZzG/Z3U1dS+gRWNTU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0HGT9Yuvcr95v+4SQ7kolopK+kx8ylXtbErtg4GjWsCwjsYEk
	l2YsqhntjwKEK8cnG6nXDaRkGhv5Me+1lvrnFDybfiwgvgVvSXWE6k6koGHPc/zPrePudsA3i8w
	+
X-Gm-Gg: ASbGncsBBNE1Rgfk2PaNYaOFInOqgkfByvUhQWfwqv8mgc+cOuteEf/L5T00aLzFw8J
	jHi4XxZFYmHAwQcDEt3xPYjjKQyrWxUcQIgVrD0GJmllHj85VJv+vG+bD7IAUNkp0Gf+h0eTctR
	Aaak+xTRawn4XG0nXmJCwSkJH2GM6QvrCls01zr+94x8eRI0rVRFAZkWBrv3bl9lSrPquS3sSJK
	ps17IN2jrKiYZ5PZeHpCEqP7sf2xKIJoeKbj02a/AOBZSEZkYTxA9ECiWmw2gg7cb2ipdZgVndn
	M6rWeKJfj95EU6I3Y4jTtw33yXVs5lpK0PiMe+z+yaZd2IBIy3fUUas2pfTzZV2Du39iRhg=
X-Google-Smtp-Source: AGHT+IEhIz2OpC6S1zU7L9ZSpzRjPuvZbv16D/e4mfEIQ+f8VyhZrUcr0a6FL6hjGn8XMZ/BFM+fwg==
X-Received: by 2002:a17:902:e54e:b0:220:f1db:d96b with SMTP id d9443c01a7336-221a1148be7mr306836495ad.41.1740498530172;
        Tue, 25 Feb 2025 07:48:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abaf5sm1657668b3a.21.2025.02.25.07.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 07:48:49 -0800 (PST)
Message-ID: <127ca898-82f9-4595-a3fe-22748818365f@rivosinc.com>
Date: Tue, 25 Feb 2025 16:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft failures
 as kfails
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org,
 atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
 <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
 <20250225-e46d015c86d53c9a2dfc35ad@orel>
 <20250225-e2ac6882b637786a5712e24e@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250225-e2ac6882b637786a5712e24e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_074852_671688_7D3CC77B 
X-CRM114-Status: GOOD (  18.31  )
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

CgpPbiAyNS8wMi8yMDI1IDE2OjMyLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MjUsIDIwMjUgYXQgMTE6MjU6MTNBTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+PiBPbiBU
dWUsIEZlYiAyNSwgMjAyNSBhdCAxMToxNDoxM0FNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4+Pgo+Pj4KPj4+IE9uIDIxLzAyLzIwMjUgMTY6NTUsIEFuZHJldyBKb25lcyB3cm90ZToK
Pj4+PiBVbnRpbCB3ZSBmaXggb3BlbnNiaSBtYXJrIHRoZXNlIGtub3duIGZhaWx1cmVzIGFzIGtm
YWlscyBzbyB3ZSBjYW4KPj4+PiBwYXNzIENJLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2Pgo+Pj4+IC0tLQo+Pj4+ICByaXNjdi9z
YmktZndmdC5jIHwgMTUgKysrKysrKysrKysrLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3Jpc2N2
L3NiaS1md2Z0LmMgYi9yaXNjdi9zYmktZndmdC5jCj4+Pj4gaW5kZXggYjEwYzE0N2YyMmRkLi4x
OTM0MGQ2YmI0OGMgMTAwNjQ0Cj4+Pj4gLS0tIGEvcmlzY3Yvc2JpLWZ3ZnQuYwo+Pj4+ICsrKyBi
L3Jpc2N2L3NiaS1md2Z0LmMKPj4+PiBAQCAtNjMsMTEgKzYzLDE3IEBAIHN0YXRpYyB2b2lkIGZ3
ZnRfY2hlY2tfYmFzZSh2b2lkKQo+Pj4+ICAJCXN0cnVjdCBzYmlyZXQgcmV0Owo+Pj4+ICAKPj4+
PiAgCQlyZXQgPSBmd2Z0X2dldF9yYXcoQklUKDMyKSk7Cj4+Pj4gLQkJc2JpcmV0X3JlcG9ydF9l
cnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4+Pj4gKwkJaWYgKHJldC5lcnJvciA9
PSAwKQo+Pj4+ICsJCQlyZXBvcnRfa2ZhaWwodHJ1ZSwgZmFsc2UsICJnZXQgZmVhdHVyZSB3aXRo
IGJpdCAzMiBzZXQgZXJyb3I6IFNCSV9FUlJfSU5WQUxJRF9QQVJBTSIpOwo+Pj4+ICsJCWVsc2UK
Pj4+PiArCQkJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0s
Cj4+Pj4gIAkJCQkgICAgImdldCBmZWF0dXJlIHdpdGggYml0IDMyIHNldCBlcnJvciIpOwo+Pj4K
Pj4+Cj4+PiBIZXkgQW5kcmV3LAo+Pj4KPj4+IEknbSBhY3R1YWxseSBhIGJpdCBjb25mdXNlZCBo
ZXJlLiBBcyByYWlzZWQgYnkgQW51cCwgdGhlIHNwZWMgc3RhdGVzIHRoYXQ6Cj4+Pgo+Pj4gIkV2
ZXJ5IFNCSSBmdW5jdGlvbiBzaG91bGQgcHJlZmVyIHVuc2lnbmVkIGxvbmcgYXMgdGhlIGRhdGEg
dHlwZS4gSXQKPj4+IGtlZXBzIHRoZSBzcGVjaWZpY2F0aW9uIHNpbXBsZSBhbmQgZWFzaWx5IGFk
YXB0YWJsZSBmb3IgYWxsIFJJU0MtViBJU0EKPj4+IHR5cGVzLiBJbiBjYXNlIHRoZSBkYXRhIGlz
IGRlZmluZWQgYXMgMzJiaXQgd2lkZSwgaGlnaGVyIHByaXZpbGVnZQo+Pj4gc29mdHdhcmUgbXVz
dCBlbnN1cmUgdGhhdCBpdCBvbmx5IHVzZXMgMzIgYml0IGRhdGEuIgo+Pj4KPj4+IERvZXMgdGhp
cyBtZWFucyA2NCBiaXRzIHZhbHVlIGFyZSB0cnVuY2F0ZWQgdG8gMzIgYml0cyA/Cj4+Cj4+IEFo
LCB5ZXMuIEkgaGFkIG5vdGljZWQgdGhhdCByZXF1aXJlZCB0cnVuY2F0aW9uIHdoaWxlIGRvaW5n
IHNvbWUgS1ZNIGZpeGVzCj4+IGFuZCBwYXRjaCA5IG9mIHRoaXMgc2VyaWVzIGlzIGV2ZW4gYWRk
aW5nIGEgdGVzdCBmb3IgaXQgZm9yIFNVU1AuIEkganVzdAo+PiBkaWRuJ3QgbG9vayBjbG9zZWx5
IGVub3VnaCBhdCB3aHkgdGhpcyBGV0ZUIHRlc3Qgd2FzIGZhaWxpbmcuIFRoZSB0ZXN0Cj4+IHNo
b3VsZCBnZXQgU0JJX1NVQ0NFU1MsIGFzIGl0IGRvZXMsIGJ1dCBpdCBzaG91bGQgYWxzbyBjaGVj
ayB0aGF0Cj4+IGZlYXR1cmUgPSBCSVQoMzIpIGJlaGF2ZXMgdGhlIHNhbWUgYXMgZmVhdHVyZXMg
PSAxLgo+IAo+IEVoLCAnLi4uYXMgZmVhdHVyZSA9IDAgKE1JU0FMSUdORURfRVhDX0RFTEVHKScu
IEZvciBub3csIEkgdGhpbmsgd2Ugc2hvdWxkCj4ganVzdCBkcm9wIHRoZSB0ZXN0LCB0aG91Z2gs
IGJlY2F1c2Ugd2UgbmVlZCBhIGZlYXR1cmUgdGhhdCwgd2hlbiBwcmVzZW50LAo+IGFsd2F5cyBh
bGxvd3MgZW5hYmxlL2Rpc2FibGUgaW4gb3JkZXIgdG8gdGVzdCBmb3IgYSBjaGFuZ2UgaW4gYmVo
YXZpb3IuCj4gV2hpbGUgd2UgbWF5IGJlIGFibGUgdG8gdG9nZ2xlIDAvMSBmb3IgTUlTQUxJR05F
RF9FWENfREVMRUcsIHdlIGNhbid0Cj4gY291bnQgb24gdHJhcHMgZ2V0dGluZyBlbmFibGVkLiBJ
J2xsIGFkZCBBRFVFIHRlc3RzIGFuZCBkbyBhIHRydW5jYXRlZAo+IGZlYXR1cmUgSUQgdGVzdCBm
b3IgaXQuCgpBaCB5ZWFoIHRvdGFsbHkgbWFrZSBzZW5zZSAhIEknbGwgbW9kaWZ5IFNTRSB0ZXN0
IGFzIHdlbGwgdG8gdGVzdCB0aGF0CjY0IGJpdHMgaWRlbnRpZmllciBhcmUgY29ycmVjdGx5IHRy
dW5jYXRlZC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
