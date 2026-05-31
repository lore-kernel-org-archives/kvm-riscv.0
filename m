Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150ECCD6E5D
	for <kvm-riscv@archiver.kernel.org>; Sun, 31 May 2026 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHV/fk98YQievxNOPuBymJxSYNAUZ5SaOgPb/GYXYJM=; b=MCmkgRdO4nQ6+s
	OmwiDKBHcIG96XlkZtrNWGre2Nwdvbd/BgYTpO9ca5p3z4800qqofuzLw5/P8NJn766FWyHGLXEvW
	eDtBxTlx22E3p6aQHwhdlfvFWOLNkOpIHmb6m+5VeULptefkVp5ZzDO/JJSUzc3ZGWjlALMvXhuGE
	e5ZRSYCVKijsSWAil2011Qbhz+R00uA6XgHNBlPRpOEeQXHfE/DRQ0q92GuwxxkzEmX0uwHWprMQ4
	0M7JxEhhkGQztpNzOPkltdriHBpVLeOO9YWfq+at7TFZZ1NEwE7wU+dAAlRyxE67DVfsNR2MC1STu
	2TImRE+O8cAzMVeEuKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThoX-00000009fsv-2fIT;
	Sun, 31 May 2026 15:10:57 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThoT-00000009fsC-2qGA
	for kvm-riscv@lists.infradead.org;
	Sun, 31 May 2026 15:10:56 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-43bf9548df4so4424842fac.0
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 08:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780240252; cv=none;
        d=google.com; s=arc-20240605;
        b=NbwFz/03QoDATi+LFLXiX+X2z4gJQ7E99YwSa38d5j+xKRNT4EjEyxCf1/pz7Pknzx
         j5d7pld8ouFKWswn5sz0TqYahvVa2PeFHkwWott5AYQL3RXnZe19iq6+kQIt/7tCkylT
         ThzK39oifcXeqzQNJ22XUxuZHN65uzJ48ilLwR3OqO4yhVvqmdVuAGNQUOxk7HKQCTHZ
         1aNrbDGg6P6RT0uH/W7K+dqAr+DNUNHNsHBUeR4lX2oWAr11iTRyvE5LgsBEc//iUnJ0
         Y04/FHyDJCgDNz8txjAVHMjiEqjSuAIdLJmlSoo0AhefhB2u6F3HPb5S/33n0H98qhxu
         iqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        fh=V3KPH/FlR4FU7injwr7Ix90SBjsIvL4Nvrd0BH+vl8M=;
        b=fJKovV3PEcta5TuBpP6sVAxkK4G06yjGyvs+8mdN4buhAUB9OBCLGP6ElJnwlzQrGj
         clVTnYyMYGvxU2hoespSfUwJYCXubOO0JVb/b0eB08jOjjVdLBwvc/BsdXQUqrwHlHbU
         Ref1+2Sg3WRn0rDIo5zUaFN0YiBjFbrKUIuc4zg/NhvyV20aTTHbIp26Io7/KIap9SB/
         fnuhfrPdFkfB7bdfwsxTuoUqBrP7ytR2+uQoFzLjl9eTtvNSDcbUxVekFGiSK26DmIKU
         1eEDdZiAgJ7yHDTIiYviWopEjGNa+b4Kc6Sp1k1Ukh7kCBZOgEkNHr/jovM0yRb+mLNX
         gsyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780240252; x=1780845052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        b=qXqf/0dgYz+bqbEFzvDHjeA7zFx0ItmZXymrWdNxBOpZF3l0mSDgQnsOtOqWp6deYA
         kDf35eOLkvduHJStaKZGuA0kQnNRT/im0lc0ZurL4tGYsrH/FY7HV/W4AY3dqGfvVs4z
         jSx0XSWQbRJwbc5tP8qTfwJyRJePNxn5BkCOWHPznGuX+8jYDoJAqgqfiE6EyTHf040q
         2+/o5KO0KubSDMAIhyx7tq6TQd/ZVr+0sH0vpmg/AMnRsPUExOLlu0X5EcImUhoeZ1Le
         +c0PVM3Aja5dqWMrXPPMQ6f6kx9Ya7ZnmQCjv0bTSKS/b93J6KOJCkKmdV86N2bUCovj
         84LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780240252; x=1780845052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        b=fItdEbI8F9893QfkHvCNwTp2VOyFTNjuVcte3E0pYr8AlRCFqPDiUgYOsO1UvA1W3v
         4z0hzVAqHx/IwFocPoQFM6giE89rGFFYbO616Tj2LX+jqUOMCxqf6UN5YydAkmrupl3f
         4uAhyyBRVMXBYcTLKnoYflohalQZMQU5v+eXu9g4SMPIKvWpPrMnA/WisVKOfShWquwS
         0/zLZUciUKCgYZiwAMHO/xnfWmgv6LkaQ3rucYwSMTm142q9NtgTikSZY90k91xho3ne
         kkWyNc9I0pyZNrv5/tdmR6VWJxKE6z4V8d4iaMLyk9ZUJT62TIF4nGT/3tRijz063iJz
         STeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8F8tkYtm/R2cfbPNTVRlnJaIWXFyrEGeztUJUGdOpV4UZT7saCSecqN9sCUsDj8r2wNtsdCC18qO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV1jrCttMkmQ0MuwODcRAX5VHknhftPVs+XbPG98MV+3VqayyA
	7b8f/9WTx5dt+1b25w0PDrxzmnzzvtlDRNO2B8394s0IGfITJRISeOUIUCAPdGJXTOab21Pxi9S
	rc40QFnXb62CVKLwl2cZuPmwbCRnBzueeGGy/9/ylXg==
X-Gm-Gg: Acq92OErpcUDJhFqbILJEZ5UBcNtIrLwm4t4N9yEW/Au+TAeYj/krM6TAs9HzibQjde
	7iE/XSJ6vewjmzthEl1LHpo3LWsuVtgZpWwtIY3Y2YgiYUvQgtkfAGxjNMI4ixSc8iVRabqE6CZ
	txLqePhi0tkOoSZdfBndOoNW3sb4piZALqkOzTeAF4YdfsJs6PDxiUObEjYw8L7TrYML0NXYNV6
	dctzGIY/Dg+gkTt2aYA/o+LIBqvkG8Yo0lJMqxMB5pFcs0terQPoPgXbah6fvV2eBSPpdFo9uuF
	2GcTS5m8eyPFiMWe0JFF0S87Jc00GUxxVuv4GslgSFJEmuxsatGi+ZaDMD19BFH87Ng/kauqCHD
	0tqiKzhqey2zrYP/5KSOJFmONRGNnbBZImFpg3w==
X-Received: by 2002:a05:6820:8c8:b0:69d:9b0a:bf8a with SMTP id
 006d021491bc7-69e10405f06mr3644904eaf.46.1780240251800; Sun, 31 May 2026
 08:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 May 2026 20:40:40 +0530
X-Gm-Features: AVHnY4LvhtY5JdkqVSNebuIYrOc1ssW4cm3YLUbYzFnlCcU5uLzs500fJwz5LYU
Message-ID: <CAAhSdy31hjQq4mt2J-eQSoQUycSFqwgg6KnMvY-68ZQX-viOTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Convert HGEI management to fully per-HART
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_081053_820107_8DD87F11 
X-CRM114-Status: GOOD (  18.81  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMzoxOeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1P
IEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4KPiBUaGlzIHNob3J0IHNlcmllcyBjb252
ZXJ0cyBSSVNDLVYgS1ZNIEFJQSdzIEh5cGVydmlzb3IgR3Vlc3QgRXh0ZXJuYWwKPiBJbnRlcnJ1
cHQgKEhHRUkpIGxpbmUgbWFuYWdlbWVudCBmcm9tIGEgZ2xvYmFsICJvbmUtc2l6ZS1maXRzLWFs
bCIKPiBtb2RlbCB0byBhIGZ1bGx5IHBlci1IQVJUIChwZXItQ1BVKSBtb2RlbC4gSXQgYWxzbyBw
ZXJmb3JtcyB0aGUKPiBjb3JyZXNwb25kaW5nIGNoYW5nZXMgaW4gdGhlIElNU0lDIGlycWNoaXAg
ZHJpdmVyLgo+Cj4gVGhlIG1vdGl2YXRpb24gaXMgdG8gcHJvcGVybHkgc3VwcG9ydCBoZXRlcm9n
ZW5lb3VzIFJJU0MtViBTb0NzCj4gKGJpZy5MSVRUTEUsIG11bHRpLXZlbmRvciBjb3JlIG1peGVz
KSB3aGVyZSBkaWZmZXJlbnQgSEFSVHMgbWF5Cj4gZXhwb3NlIGRpZmZlcmVudCBudW1iZXJzIG9m
IGd1ZXN0IGludGVycnVwdCBmaWxlcyAvIEhHRUlFIGJpdHMuCj4KPiBBZnRlciB0aGlzIHNlcmll
cywgSEdFSSBhbGxvY2F0aW9uLCBmcmVlaW5nLCBhbmQgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4gYXJl
IGNvbXBsZXRlbHkgcGVyLUhBUlQgYW5kIHRoZXJlIGFyZSBubyByZW1haW5pbmcgZ2xvYmFsIGFz
c3VtcHRpb25zCj4gYWJvdXQgbnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBmaWxlcy4KPgo+IENo
YW5nZWxvZzoKPiBWNToKPiAgLSBBdm9pZCByZS1pbml0aWFsaXppbmcgaGdjdHJsLT5sb2NrIGlu
IGt2bV9yaXNjdl9haWFfZW5hYmxlKCkKPiAgLSBTZXR1cCBmcmVlX2JpdG1hcCBvbmx5IG9uY2Ug
aW4ga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKQo+ICAtIE1ha2Uga3ZtX3Jpc2N2X2FpYV9ucl9oZ2Vp
IHNvIHRoYXQgaXQgY2FuIGJlIGNvbmN1cnJlbnRseQo+ICAgIHVwZGF0ZWQgZnJvbSBrdm1fcmlz
Y3ZfYWlhX2VuYWJsZSgpCj4KPiBWNDoKPiAgLSBEb24ndCBtb2RpZnkga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpIGluIGt2bV9yaXNjdl9haWFfZW5hYmxlKCkKPiAgICBzaW5jZSB3ZSB1c2Uga3ZtX3Jp
c2N2X2FpYV9ucl9oZ2VpIG1vc3RseSBmb3IgSEdFSSBlbmFibGUvZGlzYWJsZQo+ICAgIGNoZWNr
cy4KPiAgLSBVc2UgR0VOTUFTS19VTEwoKSBpbnN0ZWFkIG9mIGBCSVQoaGdjdHJsLT5ucl9oZ2Vp
ICsgMSkgLSAxYAo+ICAtIEFsd2F5cyBzZXR1cCBTR0VJIGludGVycnVwdCBpcnJlc3BlY3RpdmUg
b2Yga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpCj4KPiBWMzoKPiAgLSBNb3ZlIFBBVENIMyBhcyBmaXJz
dCBwYXRjaCBhbmQga2VwdCB0aGUgbnJfZ3Vlc3RfZmlsZXMgaW4KPiAgICBnbG9iYWwgY29uZmln
IGFzIHRoZSBudW1iZXIgb2YgZ3Vlc3QgZmlsZXMgYWNyb3NzIGFsbCBDUFVzCj4gIC0gRHJvcGVk
IG9yaWdpbmFsIFBBVENIMiBhbmQgc3F1YXNoZWQgb3JpZ2luYWwgUEFUQ0g0IGludG8KPiAgICBv
cmlnaW5hbCBQQVRDSDEgd2hpY2ggaXMgbm93IFBBVENIMi4KPiAgLSBBZGRyZXNzZWQgY29tbWVu
dHMgaW4gb3JpZ2luYWwgUEFUQ0gxLgo+Cj4gVjI6Cj4gIC0gQWRkIHBlci1IQVJUIElNU0lDIGd1
ZXN0IGZpbGVzIHRvIGNvbXB1dGUgZmluYWwgSEdFSSBjb3VudC4KPiAgLSBBZGQgbWluKGxvY2Fs
LT5ucl9ndWVzdF9maWxlcywgbnJfZ3Vlc3RfZmlsZXMpOwo+Cj4gVjE6Cj4gIC0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcva3ZtLXJpc2N2LzIwMjYwNDIxMTQ1NDUxLjE1OTc5MzAtMS1ndW9yZW5A
a2VybmVsLm9yZy8KPgo+IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSAoMik6Cj4gICBp
cnFjaGlwL3Jpc2N2LWltc2ljOiBBZGQgbnJfZ3Vlc3RfZmlsZXMgaW4gcGVyLUhBUlQgbG9jYWwg
Y29uZmlnCj4gICBSSVNDLVY6IEtWTTogQUlBOiBNYWtlIEhHRUkgbnVtYmVyIG1hbmFnZW1lbnQg
ZnVsbHkgcGVyLUNQVQo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAgICAg
ICB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICB8IDg4
ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5j
ICAgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAg
ICAgICAgIHwgIDggKy0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUu
YyB8ICA5ICsrLQo+ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAgICAgfCAg
NSArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjQzLjAKPgoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC03LjIKClRo
YW5rcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
