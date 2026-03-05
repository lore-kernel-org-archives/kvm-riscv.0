Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFD4F3D33E
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMVoLpKNTAx9KkgqeDiHcM5PFRSmPwq49Ipol1DJh7M=; b=Yse9vLUFK4DPW5
	MNOyFIX799UvGdwFaAHuPmhJW4SbNj+V2TyuHkDmmO5yXS7J6auCB5YqUPrVcofZzM9QlYmxr5pxB
	LQNtz2lFrjDQ4KNjPR14liVaPO+IPxrUMSdhjvnX4qWblGllxW9wlpwKE+bbSzwlLzIHkUcJ+LuOr
	KD4HBdyPbUsioSC6FpiosbBszjqAcQzTDFoCg0dUiCMTagnNUe01EI8nQka42Bv3S7gSBndDRolHg
	qGesfIa8gG24T8VJgvd6C3LhJPWTtnEqiZ5Wm+zp3PwQ8LbNd1BmW+nAjqiYjvke38dOL5gmTd5hg
	OudTfAqiN8MBkT0VB9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTx-00000002IuK-2sW9;
	Thu, 05 Mar 2026 17:27:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTv-00000002It4-3vY9
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:27:29 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3870df2331aso69218021fa.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731646; cv=none;
        d=google.com; s=arc-20240605;
        b=JZnUseRFFRq0bEbIIa+SWW/V5PqAoT94hGiaYbxV/VsJ424/n6rxmhovYtwc71ENGH
         941ivWuytFo0NsXJwQls0wgGlEzkLDwYWxDbvIPTlDO4EV/b4Sc+3aG7ZPEyQWE0rtVr
         OiketLHEEzuUIpbOqhdZBa08iayAnbiVlfy2YROsTUDYfMd4iTzor3qmX/UHPtpAxxgE
         v0w3A/y67rA2Zz7rWiX7p5FrQq4XGvhn2jpP6A+MvLFHby7PyFVqmmu4AdyETTI1y5HQ
         k0Mb66i8UO5T7lewjv+AzShfN4FuHWWJlEisMvs7I741I/5P59EFcwFSQmdX2FMjqTiM
         0bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        fh=J7ZCjoDnNyszEWfwBU/3OW0nzh5XW8690/c/J6MIrvg=;
        b=hoZ4JwwECK6McbZFoQq7368bOBkCj2oqAJxX1lvgNsd1YaD6rVatZO94mQuS9slnGZ
         HX1qI8ABxqwQO+vDo6+9kFeTqkQo25sPVkhbCx6WqWag6tOxj9tuEwA2CrUL5uiav8iZ
         x1277Po94bt3eNk9r/F57+ez1NuswiebTVJvPcNzD7Hu0q4UIuZ7RZ3JJlk6e9MLI/FT
         k+JXQCiQQo7Cbnwt+3yMlV8D4Xg9ALNNScIqgSv7DLm2NsakCaPd4kd0Q+OrmtuOfP3/
         +ZOihMXHuh83iuS6RzVN9epd42eQ4THQI0dQfKKmBFzlHzroWS3aC7YubOtPzCFlr53+
         KuDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731646; x=1773336446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=hO8GssZADpS2+Qu7DYjCmTsWiiRghESDYG+7q/J3yiUluTY5e7lG0jtPPWqmbpgGiR
         7OAduTwpTk+Uka56yvW/3Omr2K2wZROGp4NLK2CZtCKwJvki8PATw9JY+kgG/Gwjyvoi
         T03sTZfhiptkP9auyWU9TU6wFV/+GYsAAsA3PwQjZR9+cMCZ6oIKbF11VO21QEL8kBKh
         oV3er1Je0BmceEIUoxRK0dfIyrwH1+6kGEDNuIG7btcKogAI506C0fmK0T+n37Dq1Wew
         /MJqQD2UcI9qOdsiqBSCb+jnTM+7FxnYGjZz4wUh3rrIJxDt9flcDwnVEnSFlxL7x2PN
         xamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731646; x=1773336446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=fGygs4sTml/1hd4yl0xpw7LUNRgZMZfmBBzIBIie/lDRme79czqdt9Xpy1D1oas9Nm
         /mjUNkgeZ/Kb0eBH0oKGbH5Zm0NDwMbC5IQ/XyXLJR7gHuyjQfxTr/YwUbSA7ASveOsD
         kwOuYXNNklwImIFdQHkucGHSHqC9DkNYdl03gdbs5hhBZmaqJCiR5iniJbev0gIaOai1
         gCsdeGX9FFd1/VQX13dLO3MF5XHI739j5Hd1qO1r3Z1eptJH38Eaz6QPP2NrXlB0Z6N9
         V7o/ukmS3XvzRMj0HKGFujVc9g7OfblvgLRo5pfveE/gU8Lyn9uziEKgPgisbPyTjiYP
         32mw==
X-Forwarded-Encrypted: i=1; AJvYcCVLBwqTPPancP1GSaUp8ismVzvanHXRBccivyauKFwmeiEtvg1JoEo0TOYiF55FWorySnwkYhqKYNo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzymfkuS7/4oZeXkZgCG8GapFLkLdlSkjKhk3RIMmRK50AlAS0/
	ISG6uaNlo/fBcd0CAaq+uqGq4+MQc92+BfG+vUXnbqWVk9wDhO/aX1GTLuryhwd3LWhL6Jw4K+0
	3eNLXR+r2nFmyTW74TacyM/p7a1ayOBXRSFWvGHA7
X-Gm-Gg: ATEYQzxOYvYY2+jf1Z+iiD2eqZS+3le1XiFPjD8bJ9Q1gulwjumk1WVoCh+oF3/DcJj
	fwSRsOn+GDckIYerYqQ9gXzt+02ayavxyQo2N20geShZDzfWyEB27YB8siHoZiWZPFjJaPiuH7y
	UeWJ/7BH+iyLZGHIXP6QoFno0jD7+ddXCYa9BkpCo8QoYYDTd52zMSEHG0bgQ0efQq3JnwnFh4c
	OmcZkK2kYhbpCIEuCw53kHCH3d4E8h1zzMwTXuHhsyKwhcZciQrAHsQAEEuiRMrZ94O+QeaHIlw
	KAUkucMI
X-Received: by 2002:a2e:9797:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a35158513mr8005261fa.8.1772731645158; Thu, 05 Mar 2026
 09:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
 <aam7JsCyQ5Oacvl5@google.com>
In-Reply-To: <aam7JsCyQ5Oacvl5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:57 -0800
X-Gm-Features: AaiRm51o6Q3ZTz6ECMDT5TdlqFdcggDf0j5vT0TJnm45bgTm8VbA0ynEnVZFATE
Message-ID: <CALzav=fV4NX=pxKfX7hH+tO3FBNcSF1KstXsKqprpCj64Ndx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092727_990482_AFE4AF71 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCA5OjE54oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYsIERhdmlkIE1h
dGxhY2sgd3JvdGU6Cj4gPiAtc3RhdGljIHVpbnQ2NF90IHByZWFkX3VpbnQ2NChpbnQgZmQsIGNv
bnN0IGNoYXIgKmZpbGVuYW1lLCB1aW50NjRfdCBpbmRleCkKPiA+ICtzdGF0aWMgdTY0IHByZWFk
X3VpbnQ2NChpbnQgZmQsIGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgaW5kZXgpCj4KPiBJIHRo
aW5rIGl0J3MgYWxzbyB3b3J0aCBjb252ZXJ0aW5nIHRoZSBmdW5jdGlvbiB0byBwcmVhZF91NjQo
KS4KCkdvb2QgZXllIDopLiBZZXMgYWdyZWVkLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
