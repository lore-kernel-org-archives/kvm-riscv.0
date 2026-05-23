Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B25ECD4F54
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 May 2026 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnceNH0fRvObfKTSA/rzvpBwuD5nXbq9Y+lrRjFnQvA=; b=VV75z5zarVifcF
	Ho8UW3nJwif46BPYlZ019ytdT5YbjXbwmGYsi77mxp0MMT/oqhQ/QlhuCiK1HnTd++0mCwTEIwQXG
	SQdeimzox5OPgffTl/D0rB6u1QsHitd4U/OnKWdsohgz07puzYZCpEHH/wtKF95VxEjbd47a/v1Qr
	UFaqIrlvQv0npMuI8Z2BbOB4VH/Ibi4HS2Tq94xmWgSlXiTu5M+y7ynNAOhWLyPoZCADBMcBIyXiG
	2ZhlFHRboZfb0l5l6qUr4ufxWyOH/NvodxkYZBQKx8TgBwUbbZsVTDra39qQA6s2E8AA2G5DE00yx
	/DJ6AjLWEATPW0ef0GeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhM0-0000000CumV-2KCx;
	Sat, 23 May 2026 08:05:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhLx-0000000CulB-0HsF
	for kvm-riscv@lists.infradead.org;
	Sat, 23 May 2026 08:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779523500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6lOELN7ZYTPndYRuMvfJzrgaHiXzqIeclIzONy8ARI=;
	b=MZvjh+jry4/6BLVx65iMh+2395Ds/Adbn5BzAmnKEGzCFlKUVDpKMqyC3nyg38O+APCSM/
	wzVRdzJujIwMcMW0Vh4B/vaFvQYazsYfFDFDc4WJLzsBGvCUXLdk8ArqGM3Qlez8cALd5/
	juduJhL/l1rdIe7+A2g4gHVrJisab5k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-qR1WMD7MM92h-xFjmaznSg-1; Sat, 23 May 2026 04:04:58 -0400
X-MC-Unique: qR1WMD7MM92h-xFjmaznSg-1
X-Mimecast-MFC-AGG-ID: qR1WMD7MM92h-xFjmaznSg_1779523497
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4904bbc6094so7601145e9.3
        for <kvm-riscv@lists.infradead.org>; Sat, 23 May 2026 01:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779523497; x=1780128297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/6lOELN7ZYTPndYRuMvfJzrgaHiXzqIeclIzONy8ARI=;
        b=H174n9faLsntcgwDKYZkhoxLJIuWEVaB40prC7DjP9hJP9G3ZVrrREtqElYioej3tY
         AbZiFRjZqlWMhx16nzplfm0oh64puxOJiselmphkV9DgSONFCFQHwD+5NKBrlRScdkrx
         fnOjG41ceskaGGIB1W9GcR8DePfS6LTNwyQEdWja97ysZDCBuY0c3KxBFxQBqEJ/5JhQ
         OayaOCxUr/TmsNfmtAvaHcJFDsbAkzYSMSWRjfW6Hk2Su75fZGvst291yf2pXiSsnebd
         TRnqCJtgt5GWU5kRiRTqMJbqEfKwrQhoJMuAiEeHony8/MYn5yrIZI/MAdttbrM7a3q0
         X0KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v6y9y3VzurYVxhGIgZzOOkazWVqrmT3iqAUe590P8duEYtWGqUXTErofi6OlhIGI7+FBuFlx+5ro=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsC2vttgbgYcKMCFvxangZIZ3e8LXH+byzatCEm4Zd6UObtQA9
	oYc1oX6hgVTSPhbPRPnxwBOVemxtdnYcxgTTWQWUQ4e9D4sCNCM4+3GemXIobgKwDyEHBsoMxq7
	6oTfXPBMTLa7gBPAwPBe4Zv/scyHrdzEBdDkWyvxxFB/pyKVkhBlHgkaOXmx/sxyCG1AVh1DS60
	0DIHqnIeQ5C5kv2RwcHsEf5qg8dQQxNlxYX1WAoEObTQ==
X-Gm-Gg: Acq92OHYEYOFrV2wjrCEYHuX+Xoi6qaD+YUBusm6h/uwVq1Q2ZrzTuUowzFJCwwaNEp
	gc2sE7HQ/FPlbDAzcXHYejsVIu8woLCmSg7FHNek8uHq3C8lW5ToIiQgmIp9+KR9rsZF0zJbz1Q
	xhreKL2nCB/4McRhSKmVzINUP4KVe/wQe73lLqbtIeoUC4VKInwtjqwOeI0VVmjNbD66I8Eu1I0
	W5NJeCKXLAnWjOk6kVLmHjTD7DsiIWdlKDe0YFrD2kLXEEd+OKhtUOMtHXc4TNvwk46g7kUrQhg
	PXVIhIM=
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr101727185e9.28.1779523497080;
        Sat, 23 May 2026 01:04:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490428e03b8mr101726795e9.28.1779523496671; Sat, 23 May 2026
 01:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
In-Reply-To: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 23 May 2026 10:04:44 +0200
X-Gm-Features: AVHnY4LmO1eiTue2Ym-q3YsTPGm0iPVz1DvdL1ekeTtanMGSUFVES61GYaQ5wM8
Message-ID: <CABgObfY4SnyfuXZXDvBOj7bWKTziHky8JRVSQ6-012x6TZV-EQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.1 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Voo1eOYlAq-ygllU3Xd0xPkVDtqo9ixp2FOjyJzC9og_1779523497
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_010501_188972_DE275D4D 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMzowNuKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
Zml4ZXMgZm9yIHRoZSA3LjEga2VybmVsOgo+IDEpIEZpeCBpbnZhbGlkIEhWQSB3YXJuaW5nIGlu
IHN0ZWFsLXRpbWUgcmVjb3JkaW5nCj4gMikgUmV0dXJuIFNCSV9FUlJfRkFJTFVSRSB0byBndWVz
dCB1cG9uIE9PTSBpbgo+ICAgICBwbXVfZXZlbnRfaW5mbygpIGFuZCBwbXVfc25hcHNob3Rfc2V0
X3NobWVtKCkKPiAzKSBGaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIFNCSSB2MC4xIFNF
TkRfSVBJIGhhbmRsZXIKPiA0KSBGaXggc2lnbiBleHRlbnNpb24gb2YgdmFsdWUgZm9yIE1NSU8g
bG9hZHMKPgo+IFBsZWFzZSBwdWxsLgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDUyMDBmNWY0OTNmNzlmMTRiYmRjMzQ5ZTQwMmE0MGRm
YjMyZjIzYzg6Cj4KPiAgIExpbnV4IDcuMS1yYzQgKDIwMjYtMDUtMTcgMTM6NTk6NTggLTA3MDAp
Cj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6
Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNy4x
LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNzgzMjUzNGE4MTYwMjc2Y2Nj
YjlhOGNjOGNhZmI1NjE0YzU3OWQwOgo+Cj4gICBSSVNDLVY6IEtWTTogRml4IHNpZ24gZXh0ZW5z
aW9uIGZvciBNTUlPIGxvYWRzICgyMDI2LTA1LTE4IDEwOjE5OjE4ICswNTMwKQoKUHVsbGVkLCB0
aGFua3MuCgpQYW9sbwoKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9yIDcuMSwgdGFr
ZSAjMQo+Cj4gLSBGaXggaW52YWxpZCBIVkEgd2FybmluZyBpbiBzdGVhbC10aW1lIHJlY29yZGlu
Zwo+IC0gUmV0dXJuIFNCSV9FUlJfRkFJTFVSRSB0byBndWVzdCB1cG9uIE9PTSBpbiBwbXVfZXZl
bnRfaW5mbygpCj4gICBhbmQgcG11X3NuYXBzaG90X3NldF9zaG1lbSgpCj4gLSBGaXggTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGluIFNCSSB2MC4xIFNFTkRfSVBJIGhhbmRsZXIKPiAtIEZpeCBz
aWduIGV4dGVuc2lvbiBvZiB2YWx1ZSBmb3IgTU1JTyBsb2Fkcwo+Cj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEppYWth
aSBYdSAoMyk6Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBpbnZhbGlkIEhWQSB3YXJuaW5nIGlu
IHN0ZWFsLXRpbWUgcmVjb3JkaW5nCj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UgaW4gU0JJIHYwLjEgU0VORF9JUEkgaGFuZGxlcgo+ICAgICAgIFJJU0Mt
VjogS1ZNOiBGaXggc2lnbiBleHRlbnNpb24gZm9yIE1NSU8gbG9hZHMKPgo+IE9zYW1hIEFiZGVs
a2FkZXIgKDIpOgo+ICAgICAgIHJpc2N2OiBrdm06IHJldHVybiBTQklfRVJSX0ZBSUxVUkUgZm9y
IHBtdV9zbmFwc2hvdF9zZXRfc2htZW0oKSB3aGVuIE9PTQo+ICAgICAgIHJpc2N2OiBrdm06IHJl
dHVybiBTQklfRVJSX0ZBSUxVUkUgZm9yIHBtdV9ldmVudF9pbmZvKCkgd2hlbiBPT00KPgo+ICBh
cmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyAgICB8ICA5ICsrKystLS0tLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jICAgICB8IDEyICsrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9zdGEuYyB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3YwMS5jIHwg
IDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
