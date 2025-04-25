Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CBCC369D7
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6ec+tbhbZkbz229uFIG+0YqU7lTmB93b6ByQF013iA=; b=o0bNzIuutROHoD
	mAh/iaULQpuc1a3VvhPTwo4eJe2crCAo6hU/LG8w8TzbYXHGJajpOshrr9IF1XZPeK3FmSj4rxtBb
	dPFlDveYKN1lQp7/4rEI1c3eLr2FGIiF2utrTrFepNpEfdcYZNPtIEwQFOSKMwS7uGUXC8kiEB8fr
	hI26jMahp9X0dU3tyDyjZi5qQ5WIXbO2jokhY4syEKToUG5HqpX2aZkeSuonyHOALt0Q3a+Bx/WHY
	v2pv1/2ojoY4l7eUevDsYC/TOlJ3veBhrTO+7IuzrvwbSL6RKHS7x092XKjDyoFh7G1T9w+bAWkLT
	eID9X7b6tmXdcQhgiocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IsH-0000000HEe4-0aJc;
	Fri, 25 Apr 2025 13:13:49 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hvb-0000000H4yt-01Xp
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:13:12 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d812103686so5955075ab.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745583190; x=1746187990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LVCfKKGZ+VAx31B/QvtWLC+cXlvT+nFAC3b1QAmkzg=;
        b=ftWJvOAqkZpPSt1p0dBsZEyZ5F2hBnqXJwBVOs41dmivxy9w3Ec6BgUi2Wfozt8tOr
         cJGxayEW4xCrFqJd2siy2hfH4AAJpK3kS/BwisGILFBEQ+cXBaRl+qV1lpCdfzO4tX30
         NoLekgTyYeeXALOJcDIttr9rtTg4yM7GRI84t6GbZ/uDY9QSNvQn4kUdNja9XYJNfI7P
         uV31RIHKMUMoDrMTvJpkAk6mIkVqiLpltOlfGOatwqWa2qjA504mmkzcbOz3QyQVStG+
         v8N7ZlJOb4CjfqBgCFA5zJY85vwQPnYWf4b7MCTd8XveBnksLK5Dig6jwQV/RdIyadav
         VxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583190; x=1746187990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LVCfKKGZ+VAx31B/QvtWLC+cXlvT+nFAC3b1QAmkzg=;
        b=hU3Sjhuu4SfgkrgrlVLEUdNPlFI8hSPE7ebfHypqrcZF+tu93yzLBsoEurG0kThViP
         3WsJGeDaOEEqYN3QujAlCAMODJDCvkh4jGhJ3F4dd9asQjf7qQGQOfiEAu8LP9dH7J7e
         n56o/+WopMkAZcq6qjZnQpIH4f0nwlkDpEzWW+Nip0VhF01KdGiJDKjRvN+hT+ck9cN6
         uVCrO0kILQ+Cd9YtgBFwTS+4oBimi7Pep22sNOI6H2XbHDQ3MpB4qZQa2JiNTLWhWZFf
         WVgSlpuHnWYKZdQcLXjHklFF30A79SsumOnVhl1IgM6NBnUTI7nxYrxkAVG9U8NfPoUh
         6OLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiVV6kcIP9YaiYSLIy7ThZCOQEk090afoyfw2gjW7n8ROjuWkgKssnKXeJMxkDCEasGLCnJExeK1U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtRm4ZER5LnxZBc2KobBqEVrbeEN2w475CIZhAmim2eMvPC4Af
	rH8ReTQQw7cYZ3IArSEPYgvAWOEiVG22xYwsKUcNpKmBwNdkWgga6WlvnAB6URZQ6AqqZeBqeWu
	wGutujyL9Dnd053oruSQy/LHK6OdR/kURCAdojg==
X-Gm-Gg: ASbGnctKeS5iic+YcNz1dQuGuC26UtAoK3S+jAENX534lY2btT/nDdbw0XgmmVWm1Us
	bF50TPppIdFPI21IrL8FYRRii3Z6q8LoQtY1hPi98zK8jpkwSZz2OUDPcSoLaq7S1BWG+iCiB25
	NSYKFMIpew47PBsSmieKNFSC0=
X-Google-Smtp-Source: AGHT+IEc4wQDIyAonXTkWsqY11L7QFIJfNSBIAH3ZY0qz8y4ByrVUK33TWmLeL/12iYhQYPbulWRTGy5kuvd1J/u8sE=
X-Received: by 2002:a05:6e02:2487:b0:3d9:2bfc:5767 with SMTP id
 e9e14a558f8ab-3d93b6cae6amr18674675ab.0.1745583189986; Fri, 25 Apr 2025
 05:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com> <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 17:42:58 +0530
X-Gm-Features: ATxdqUF3lkgMIhQKkdyVfB74UNuy_-e8DUJtUETJoF6k8Xhu-0BFfCT8lsZQsJA
Message-ID: <CAAhSdy0=c_dq7EpztQ9t83qbXBqD6E92xUadYvyv_kFj-Epw6Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify exact
 exception type
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051311_045358_D0FE6075 
X-CRM114-Status: GOOD (  17.23  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgNjoxMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIHNiaV9wbXVfdGVzdCBjb250aW51
ZXMgaWYgdGhlIGV4Y2VwdGlvbiB0eXBlIGlzIGlsbGVnYWwKPiBpbnN0cnVjdGlvbiBiZWNhdXNl
IGFjY2VzcyB0byBocG1jb3VudGVyIHdpbGwgZ2VuZXJhdGUgdGhhdC4gSG93ZXZlciwgd2UKPiBt
YXkgZ2V0IGlsbGVnYWwgZm9yIG90aGVyIHJlYXNvbnMgYXMgd2VsbCB3aGljaCBzaG91bGQgcmVz
dWx0IGluIHRlc3QKPiBhc3NlcnRpb24uCgoiLi4uIEhvd2V2ZXIsIGlsbGVnYWwgaW5zdHJ1Y3Rp
b24gZXhjZXB0aW9ucyBtYXkgb2NjdXIgZHVlIHRvIG90aGVyCnJlYXNvbnMgd2hpY2ggc2hvdWxk
IHJlc3VsdCBpbiB0ZXN0IGFzc2VydGlvbi4iCgo+Cj4gVXNlIHRoZSBzdHZhbCB0byBkZWNvZGUg
dGhlIGV4YWN0IHR5cGUgb2YgaW5zdHJ1Y3Rpb25zIGFuZCB3aGljaCBjc3JzIGFyZQo+IGJlaW5n
IGFjY2Vzc2VkIGlmIGl0IGlzIGNzciBhY2Nlc3MgaW5zdHJ1Y3Rpb25zLiBBc3NlcnQgaW4gYWxs
IGNhc2VzCj4gZXhjZXB0IGlmIGl0IGlzIGEgY3NyIGFjY2VzcyBpbnN0cnVjdGlvbnMgdGhhdCBh
Y2Nlc3MgdmFsaWQgUE1VIHJlbGF0ZWQKPiByZWdpc3RlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCk90aGVyd2lzZSwgTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
PiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5j
IHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jp
c2N2L3NiaV9wbXVfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3Ni
aV9wbXVfdGVzdC5jCj4gaW5kZXggMDM0MDZkZTQ5ODlkLi4xMWJkZTY5YjUyMzggMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4g
QEAgLTEyOCwxMSArMTI4LDQzIEBAIHN0YXRpYyB2b2lkIHN0b3BfY291bnRlcih1bnNpZ25lZCBs
b25nIGNvdW50ZXIsIHVuc2lnbmVkIGxvbmcgc3RvcF9mbGFncykKPiAgICAgICAgICAgICAgICAg
ICAgICAgICJVbmFibGUgdG8gc3RvcCBjb3VudGVyICVsZCBlcnJvciAlbGRcbiIsIGNvdW50ZXIs
IHJldC5lcnJvcik7Cj4gIH0KPgo+ICsjZGVmaW5lIElOU05fT1BDT0RFX01BU0sgICAgICAgMHgw
MDdjCj4gKyNkZWZpbmUgSU5TTl9PUENPREVfU0hJRlQgICAgICAyCj4gKyNkZWZpbmUgSU5TTl9P
UENPREVfU1lTVEVNICAgICAyOAo+ICsKPiArI2RlZmluZSBJTlNOX01BU0tfRlVOQ1QzICAgICAg
IDB4NzAwMAo+ICsjZGVmaW5lIElOU05fU0hJRlRfRlVOQ1QzICAgICAgMTIKPiArCj4gKyNkZWZp
bmUgSU5TTl9DU1JfTUFTSyAgICAgICAgICAweGZmZjAwMDAwCj4gKyNkZWZpbmUgSU5TTl9DU1Jf
U0hJRlQgICAgICAgICAyMAo+ICsKPiArI2RlZmluZSBHRVRfUk0oaW5zbikgICAgICAgICAgICAo
KChpbnNuKSAmIElOU05fTUFTS19GVU5DVDMpID4+IElOU05fU0hJRlRfRlVOQ1QzKQo+ICsjZGVm
aW5lIEdFVF9DU1JfTlVNKGluc24pICAgICAgICgoKGluc24pICYgSU5TTl9DU1JfTUFTSykgPj4g
SU5TTl9DU1JfU0hJRlQpCj4gKwo+ICBzdGF0aWMgdm9pZCBndWVzdF9pbGxlZ2FsX2V4Y2VwdGlv
bl9oYW5kbGVyKHN0cnVjdCBleF9yZWdzICpyZWdzKQo+ICB7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGluc247Cj4gKyAgICAgICBpbnQgb3Bjb2RlLCBjc3JfbnVtLCBmdW5jdDM7Cj4gKwo+ICAg
ICAgICAgX19HVUVTVF9BU1NFUlQocmVncy0+Y2F1c2UgPT0gRVhDX0lOU1RfSUxMRUdBTCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIGV4Y2VwdGlvbiBoYW5kbGVyICVseFxu
IiwgcmVncy0+Y2F1c2UpOwo+Cj4gKyAgICAgICBpbnNuID0gcmVncy0+c3R2YWw7Cj4gKyAgICAg
ICBvcGNvZGUgPSAoaW5zbiAmIElOU05fT1BDT0RFX01BU0spID4+IElOU05fT1BDT0RFX1NISUZU
Owo+ICsgICAgICAgX19HVUVTVF9BU1NFUlQob3Bjb2RlID09IElOU05fT1BDT0RFX1NZU1RFTSwK
PiArICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIGluc3RydWN0aW9uIHdpdGggb3Bj
b2RlIDB4JXggaW5zbiAweCVseFxuIiwgb3Bjb2RlLCBpbnNuKTsKPiArCj4gKyAgICAgICBjc3Jf
bnVtID0gR0VUX0NTUl9OVU0oaW5zbik7Cj4gKyAgICAgICBmdW5jdDMgPSBHRVRfUk0oaW5zbik7
Cj4gKyAgICAgICAvKiBWYWxpZGF0ZSBpZiBpdCBpcyBhIENTUiByZWFkL3dyaXRlIG9wZXJhdGlv
biAqLwo+ICsgICAgICAgX19HVUVTVF9BU1NFUlQoZnVuY3QzIDw9IDcgJiYgKGZ1bmN0MyAhPSAw
IHx8IGZ1bmN0MyAhPSA0KSwKPiArICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIHN5
c3RlbSBvcGNvZGUgd2l0aCBmdW5jdDMgMHgleCBjc3JfbnVtIDB4JXhcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICBmdW5jdDMsIGNzcl9udW0pOwo+ICsKPiArICAgICAgIC8qIFZhbGlkYXRl
IGlmIGl0IGlzIGEgSFBNQ09VTlRFUiBDU1Igb3BlcmF0aW9uICovCj4gKyAgICAgICBfX0dVRVNU
X0FTU0VSVChjc3JfbnVtID09IENTUl9DWUNMRSB8fCBjc3JfbnVtIDw9IENTUl9IUE1DT1VOVEVS
MzEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAiVW5leHBlY3RlZCBjc3JfbnVtIDB4JXhcbiIs
IGNzcl9udW0pOwo+ICsKPiAgICAgICAgIGlsbGVnYWxfaGFuZGxlcl9pbnZva2VkID0gdHJ1ZTsK
PiAgICAgICAgIC8qIHNraXAgdGhlIHRyYXBwaW5nIGluc3RydWN0aW9uICovCj4gICAgICAgICBy
ZWdzLT5lcGMgKz0gNDsKPgo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
